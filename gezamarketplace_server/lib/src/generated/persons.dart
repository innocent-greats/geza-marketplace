/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Person extends _i1.TableRow {
  Person({
    int? id,
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
  }) : super(id);

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

  static final t = PersonTable();

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
  String get tableName => 'person';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'firstName':
        firstName = value;
        return;
      case 'lastName':
        lastName = value;
        return;
      case 'phone':
        phone = value;
        return;
      case 'email':
        email = value;
        return;
      case 'password':
        password = value;
        return;
      case 'pin':
        pin = value;
        return;
      case 'city':
        city = value;
        return;
      case 'neighbourhood':
        neighbourhood = value;
        return;
      case 'locationCoordinate':
        locationCoordinate = value;
        return;
      case 'walletId':
        walletId = value;
        return;
      case 'specialization':
        specialization = value;
        return;
      case 'rating':
        rating = value;
        return;
      case 'accountType':
        accountType = value;
        return;
      case 'isCustomer':
        isCustomer = value;
        return;
      case 'isTrader':
        isTrader = value;
        return;
      case 'followers':
        followers = value;
        return;
      case 'searchTerm':
        searchTerm = value;
        return;
      case 'profileImagePathLocation':
        profileImagePathLocation = value;
        return;
      case 'createdDate':
        createdDate = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Person>> find(
    _i1.Session session, {
    PersonExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Person>(
      where: where != null ? where(Person.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Person?> findSingleRow(
    _i1.Session session, {
    PersonExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Person>(
      where: where != null ? where(Person.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Person?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Person>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PersonExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Person>(
      where: where(Person.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Person row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Person row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Person row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PersonExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Person>(
      where: where != null ? where(Person.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PersonExpressionBuilder = _i1.Expression Function(PersonTable);

class PersonTable extends _i1.Table {
  PersonTable() : super(tableName: 'person');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final firstName = _i1.ColumnString('firstName');

  final lastName = _i1.ColumnString('lastName');

  final phone = _i1.ColumnString('phone');

  final email = _i1.ColumnString('email');

  final password = _i1.ColumnString('password');

  final pin = _i1.ColumnString('pin');

  final city = _i1.ColumnString('city');

  final neighbourhood = _i1.ColumnString('neighbourhood');

  final locationCoordinate = _i1.ColumnInt('locationCoordinate');

  final walletId = _i1.ColumnString('walletId');

  final specialization = _i1.ColumnSerializable('specialization');

  final rating = _i1.ColumnDouble('rating');

  final accountType = _i1.ColumnString('accountType');

  final isCustomer = _i1.ColumnBool('isCustomer');

  final isTrader = _i1.ColumnBool('isTrader');

  final followers = _i1.ColumnSerializable('followers');

  final searchTerm = _i1.ColumnString('searchTerm');

  final profileImagePathLocation = _i1.ColumnString('profileImagePathLocation');

  final createdDate = _i1.ColumnString('createdDate');

  @override
  List<_i1.Column> get columns => [
        id,
        firstName,
        lastName,
        phone,
        email,
        password,
        pin,
        city,
        neighbourhood,
        locationCoordinate,
        walletId,
        specialization,
        rating,
        accountType,
        isCustomer,
        isTrader,
        followers,
        searchTerm,
        profileImagePathLocation,
        createdDate,
      ];
}

@Deprecated('Use PersonTable.t instead.')
PersonTable tPerson = PersonTable();
