/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Share extends _i1.TableRow {
  Share({
    int? id,
    this.dateAdded,
    required this.stylistId,
    this.beautyStyleId,
    this.shareBy,
    this.sharewith,
  }) : super(id);

  factory Share.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Share(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateAdded: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateAdded']),
      stylistId:
          serializationManager.deserialize<int>(jsonSerialization['stylistId']),
      beautyStyleId: serializationManager
          .deserialize<int?>(jsonSerialization['beautyStyleId']),
      shareBy:
          serializationManager.deserialize<int?>(jsonSerialization['shareBy']),
      sharewith: serializationManager
          .deserialize<int?>(jsonSerialization['sharewith']),
    );
  }

  static final t = ShareTable();

  DateTime? dateAdded;

  int stylistId;

  int? beautyStyleId;

  int? shareBy;

  int? sharewith;

  @override
  String get tableName => 'share';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'stylistId': stylistId,
      'beautyStyleId': beautyStyleId,
      'shareBy': shareBy,
      'sharewith': sharewith,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'stylistId': stylistId,
      'beautyStyleId': beautyStyleId,
      'shareBy': shareBy,
      'sharewith': sharewith,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'stylistId': stylistId,
      'beautyStyleId': beautyStyleId,
      'shareBy': shareBy,
      'sharewith': sharewith,
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
      case 'stylistId':
        stylistId = value;
        return;
      case 'beautyStyleId':
        beautyStyleId = value;
        return;
      case 'shareBy':
        shareBy = value;
        return;
      case 'sharewith':
        sharewith = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Share>> find(
    _i1.Session session, {
    ShareExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Share>(
      where: where != null ? where(Share.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Share?> findSingleRow(
    _i1.Session session, {
    ShareExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Share>(
      where: where != null ? where(Share.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Share?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Share>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ShareExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Share>(
      where: where(Share.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Share row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Share row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Share row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ShareExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Share>(
      where: where != null ? where(Share.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ShareExpressionBuilder = _i1.Expression Function(ShareTable);

class ShareTable extends _i1.Table {
  ShareTable() : super(tableName: 'share');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final dateAdded = _i1.ColumnDateTime('dateAdded');

  final stylistId = _i1.ColumnInt('stylistId');

  final beautyStyleId = _i1.ColumnInt('beautyStyleId');

  final shareBy = _i1.ColumnInt('shareBy');

  final sharewith = _i1.ColumnInt('sharewith');

  @override
  List<_i1.Column> get columns => [
        id,
        dateAdded,
        stylistId,
        beautyStyleId,
        shareBy,
        sharewith,
      ];
}

@Deprecated('Use ShareTable.t instead.')
ShareTable tShare = ShareTable();
