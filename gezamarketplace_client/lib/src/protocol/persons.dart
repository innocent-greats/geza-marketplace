/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Person extends _i1.SerializableEntity {
  Person({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.email,
    this.password,
    this.pin,
    this.city,
    this.neighbourhood,
    this.locationCoordinate,
    this.walletId,
    this.specialization,
    this.rating,
    this.accountType,
    this.isCustomer,
    this.isTrader,
    this.followers,
    this.searchTerm,
    this.profileImagePathLocation,
    this.createdDate,
  });

  factory Person.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Person(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      firstName: serializationManager
          .deserialize<String>(jsonSerialization['firstName']),
      lastName: serializationManager
          .deserialize<String>(jsonSerialization['lastName']),
      phone:
          serializationManager.deserialize<String>(jsonSerialization['phone']),
      email:
          serializationManager.deserialize<String?>(jsonSerialization['email']),
      password: serializationManager
          .deserialize<String?>(jsonSerialization['password']),
      pin: serializationManager.deserialize<String?>(jsonSerialization['pin']),
      city:
          serializationManager.deserialize<String?>(jsonSerialization['city']),
      neighbourhood: serializationManager
          .deserialize<String?>(jsonSerialization['neighbourhood']),
      locationCoordinate: serializationManager
          .deserialize<int?>(jsonSerialization['locationCoordinate']),
      walletId: serializationManager
          .deserialize<String?>(jsonSerialization['walletId']),
      specialization: serializationManager
          .deserialize<List<String>?>(jsonSerialization['specialization']),
      rating: serializationManager
          .deserialize<double?>(jsonSerialization['rating']),
      accountType: serializationManager
          .deserialize<String?>(jsonSerialization['accountType']),
      isCustomer: serializationManager
          .deserialize<bool?>(jsonSerialization['isCustomer']),
      isTrader: serializationManager
          .deserialize<bool?>(jsonSerialization['isTrader']),
      followers: serializationManager
          .deserialize<List<_i2.Person>?>(jsonSerialization['followers']),
      searchTerm: serializationManager
          .deserialize<String?>(jsonSerialization['searchTerm']),
      profileImagePathLocation: serializationManager
          .deserialize<String?>(jsonSerialization['profileImagePathLocation']),
      createdDate: serializationManager
          .deserialize<String?>(jsonSerialization['createdDate']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String firstName;

  String lastName;

  String phone;

  String? email;

  String? password;

  String? pin;

  String? city;

  String? neighbourhood;

  int? locationCoordinate;

  String? walletId;

  List<String>? specialization;

  double? rating;

  String? accountType;

  bool? isCustomer;

  bool? isTrader;

  List<_i2.Person>? followers;

  String? searchTerm;

  String? profileImagePathLocation;

  String? createdDate;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'password': password,
      'pin': pin,
      'city': city,
      'neighbourhood': neighbourhood,
      'locationCoordinate': locationCoordinate,
      'walletId': walletId,
      'specialization': specialization,
      'rating': rating,
      'accountType': accountType,
      'isCustomer': isCustomer,
      'isTrader': isTrader,
      'followers': followers,
      'searchTerm': searchTerm,
      'profileImagePathLocation': profileImagePathLocation,
      'createdDate': createdDate,
    };
  }
}
