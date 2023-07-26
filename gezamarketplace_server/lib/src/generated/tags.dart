/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Tag extends _i1.TableRow {
  Tag({
    int? id,
    this.dateAdded,
    required this.stylistId,
    this.beautyStyleId,
    this.personTaggedId,
  }) : super(id);

  factory Tag.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Tag(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateAdded: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateAdded']),
      stylistId:
          serializationManager.deserialize<int>(jsonSerialization['stylistId']),
      beautyStyleId: serializationManager
          .deserialize<int?>(jsonSerialization['beautyStyleId']),
      personTaggedId: serializationManager
          .deserialize<int?>(jsonSerialization['personTaggedId']),
    );
  }

  static final t = TagTable();

  DateTime? dateAdded;

  int stylistId;

  int? beautyStyleId;

  int? personTaggedId;

  @override
  String get tableName => 'tag';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'stylistId': stylistId,
      'beautyStyleId': beautyStyleId,
      'personTaggedId': personTaggedId,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'stylistId': stylistId,
      'beautyStyleId': beautyStyleId,
      'personTaggedId': personTaggedId,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'stylistId': stylistId,
      'beautyStyleId': beautyStyleId,
      'personTaggedId': personTaggedId,
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
      case 'personTaggedId':
        personTaggedId = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Tag>> find(
    _i1.Session session, {
    TagExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Tag>(
      where: where != null ? where(Tag.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Tag?> findSingleRow(
    _i1.Session session, {
    TagExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Tag>(
      where: where != null ? where(Tag.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Tag?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Tag>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required TagExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Tag>(
      where: where(Tag.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    TagExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Tag>(
      where: where != null ? where(Tag.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TagExpressionBuilder = _i1.Expression Function(TagTable);

class TagTable extends _i1.Table {
  TagTable() : super(tableName: 'tag');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final dateAdded = _i1.ColumnDateTime('dateAdded');

  final stylistId = _i1.ColumnInt('stylistId');

  final beautyStyleId = _i1.ColumnInt('beautyStyleId');

  final personTaggedId = _i1.ColumnInt('personTaggedId');

  @override
  List<_i1.Column> get columns => [
        id,
        dateAdded,
        stylistId,
        beautyStyleId,
        personTaggedId,
      ];
}

@Deprecated('Use TagTable.t instead.')
TagTable tTag = TagTable();
