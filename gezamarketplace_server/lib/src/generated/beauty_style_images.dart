/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Images extends _i1.TableRow {
  Images({
    int? id,
    this.dateAdded,
    required this.uploaderId,
    this.beautyStyleId,
    required this.pathLocation,
  }) : super(id);

  factory Images.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Images(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateAdded: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateAdded']),
      uploaderId: serializationManager
          .deserialize<int>(jsonSerialization['uploaderId']),
      beautyStyleId: serializationManager
          .deserialize<int?>(jsonSerialization['beautyStyleId']),
      pathLocation: serializationManager
          .deserialize<String>(jsonSerialization['pathLocation']),
    );
  }

  static final t = ImagesTable();

  DateTime? dateAdded;

  int uploaderId;

  int? beautyStyleId;

  String pathLocation;

  @override
  String get tableName => 'images';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'uploaderId': uploaderId,
      'beautyStyleId': beautyStyleId,
      'pathLocation': pathLocation,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'uploaderId': uploaderId,
      'beautyStyleId': beautyStyleId,
      'pathLocation': pathLocation,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'uploaderId': uploaderId,
      'beautyStyleId': beautyStyleId,
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
      case 'uploaderId':
        uploaderId = value;
        return;
      case 'beautyStyleId':
        beautyStyleId = value;
        return;
      case 'pathLocation':
        pathLocation = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Images>> find(
    _i1.Session session, {
    ImagesExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Images>(
      where: where != null ? where(Images.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Images?> findSingleRow(
    _i1.Session session, {
    ImagesExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Images>(
      where: where != null ? where(Images.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Images?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Images>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ImagesExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Images>(
      where: where(Images.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Images row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Images row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Images row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ImagesExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Images>(
      where: where != null ? where(Images.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ImagesExpressionBuilder = _i1.Expression Function(ImagesTable);

class ImagesTable extends _i1.Table {
  ImagesTable() : super(tableName: 'images');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final dateAdded = _i1.ColumnDateTime('dateAdded');

  final uploaderId = _i1.ColumnInt('uploaderId');

  final beautyStyleId = _i1.ColumnInt('beautyStyleId');

  final pathLocation = _i1.ColumnString('pathLocation');

  @override
  List<_i1.Column> get columns => [
        id,
        dateAdded,
        uploaderId,
        beautyStyleId,
        pathLocation,
      ];
}

@Deprecated('Use ImagesTable.t instead.')
ImagesTable tImages = ImagesTable();
