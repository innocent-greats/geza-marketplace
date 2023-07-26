/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class ProfileImages extends _i1.TableRow {
  ProfileImages({
    int? id,
    this.dateAdded,
    required this.personId,
    required this.pathLocation,
  }) : super(id);

  factory ProfileImages.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ProfileImages(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateAdded: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateAdded']),
      personId:
          serializationManager.deserialize<int>(jsonSerialization['personId']),
      pathLocation: serializationManager
          .deserialize<String>(jsonSerialization['pathLocation']),
    );
  }

  static final t = ProfileImagesTable();

  DateTime? dateAdded;

  int personId;

  String pathLocation;

  @override
  String get tableName => 'profile_images';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'personId': personId,
      'pathLocation': pathLocation,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'personId': personId,
      'pathLocation': pathLocation,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'personId': personId,
      'pathLocation': pathLocation,
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
      case 'dateAdded':
        dateAdded = value;
        return;
      case 'personId':
        personId = value;
        return;
      case 'pathLocation':
        pathLocation = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ProfileImages>> find(
    _i1.Session session, {
    ProfileImagesExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProfileImages>(
      where: where != null ? where(ProfileImages.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ProfileImages?> findSingleRow(
    _i1.Session session, {
    ProfileImagesExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ProfileImages>(
      where: where != null ? where(ProfileImages.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ProfileImages?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ProfileImages>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ProfileImagesExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProfileImages>(
      where: where(ProfileImages.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ProfileImages row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ProfileImages row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ProfileImages row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ProfileImagesExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProfileImages>(
      where: where != null ? where(ProfileImages.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ProfileImagesExpressionBuilder = _i1.Expression Function(
    ProfileImagesTable);

class ProfileImagesTable extends _i1.Table {
  ProfileImagesTable() : super(tableName: 'profile_images');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final dateAdded = _i1.ColumnDateTime('dateAdded');

  final personId = _i1.ColumnInt('personId');

  final pathLocation = _i1.ColumnString('pathLocation');

  @override
  List<_i1.Column> get columns => [
        id,
        dateAdded,
        personId,
        pathLocation,
      ];
}

@Deprecated('Use ProfileImagesTable.t instead.')
ProfileImagesTable tProfileImages = ProfileImagesTable();
