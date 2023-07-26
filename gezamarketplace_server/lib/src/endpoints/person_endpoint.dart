import 'package:gezamarketplace_server/src/generated/protocol.dart';
import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class PersonEndpoint extends Endpoint {
  Future<List<Person>> getAllPersons(
    Session session,
  ) async {
    var allPersons = await Person.find(session);
    return allPersons;
  }

  Future<String?> handleSignUp(Session session, Person person) async {
    try {
      session.log('handleSignUp is called. $person');

      // Check if the username is already taken
      final existingUser = await Person.findSingleRow(
        session,
        where: (user) => user.phone.equals(person.phone),
      );
      session.log('handleSignUp check existing user $existingUser');

      if (existingUser != null) {
        session.log('Username ${person.phone} is already taken.');
        // return 'Uer with phone ${person.phone} is already taken.';
      }
      session.log('createPerson called');

      await Person.insert(session, person);
      final newPerson = await Person.findSingleRow(
        session,
        where: (user) => user.phone.equals(person.phone),
      );

      session.log('new Person created $newPerson');
      // Generate a token for the user
      JwtClaim claim = JwtClaim(
          subject: person.phone.toString(),
          issuer: 'geza-marketplace',
          audience: ['geza-marketplace.io'],
          payload: newPerson!.allToJson());

      // Create a new user

      var token = issueJwtHS256(claim, "jwtKey");
      session.log('created claim $token');

      return token;
    } catch (e) {
      session.log('catch errors');

      session.log(e.toString());
    } finally {}
    return null;
  }

  Future<String?> getUserAccount(Session session, int id) async {
    try {
      session.log('handleSignIn is called.');
      // session.log('goot user $phone');

      // Check if the username is already taken
      final user = await Person.findSingleRow(
        session,
        where: (user) => user.id.equals(id),
      );
      // session.log('LogginUser user ${user?.id}');

      // session.log('goot user $user');
      if (user != null) {
        // Generate a token for the user

        JwtClaim authclaim = JwtClaim(
            subject: user.phone.toString(),
            issuer: 'geza-marketplace',
            audience: [
              'geza-marketplace.io'
            ],
            payload: {
              "user": user.allToJson(),
              "authKey": user.allToJson(),
            });
        var authKey = await session.auth
            .signInUser(user.id as int, issueJwtHS256(authclaim, "jwtKey"));
        // Create a new user

        session.log('created authKey $authKey');

        return authKey.toString();
      }
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return null;
  }

  Future<Person?> getPerson(Session session, int id) async {
    var result = await Person.findById(session, id);
    return result;
  }

  Future<bool> updatePerson(Session session, Person person) async {
    try {
      session.log('updatePerson Method');
      session.log('updating Person ${person.profileImagePathLocation}');
      var result = await Person.findById(session, person.id as int);
      session.log('updating Person of $result');

      result!.profileImagePathLocation = person.profileImagePathLocation;
      await session.db.update(result);
      final updatedPerson = await Person.findSingleRow(
        session,
        where: (user) => user.id.equals(person.id),
      );
      session.log('updated Person $updatedPerson');
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }

  Future<bool> deletePerson(Session session, int id) async {
    var result = await Person.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }
}
