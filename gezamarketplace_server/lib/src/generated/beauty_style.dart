/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class BeautyStyle extends _i1.TableRow {
  BeautyStyle({
    int? id,
    required this.name,
    required this.category,
    this.description,
    required this.cityName,
    required this.neighbourhoodName,
    this.dateAdded,
    this.amount,
    required this.images,
    this.tags,
    this.shares,
    this.stylistId,
    this.customerId,
    this.searchTerm,
  }) : super(id);

  factory BeautyStyle.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BeautyStyle(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      cityName: serializationManager
          .deserialize<String>(jsonSerialization['cityName']),
      neighbourhoodName: serializationManager
          .deserialize<String>(jsonSerialization['neighbourhoodName']),
      dateAdded: serializationManager
          .deserialize<String?>(jsonSerialization['dateAdded']),
      amount: serializationManager
          .deserialize<double?>(jsonSerialization['amount']),
      images: serializationManager
          .deserialize<List<_i2.Images>>(jsonSerialization['images']),
      tags: serializationManager
          .deserialize<List<_i2.Tag>?>(jsonSerialization['tags']),
      shares: serializationManager
          .deserialize<List<_i2.Share>?>(jsonSerialization['shares']),
      stylistId: serializationManager
          .deserialize<int?>(jsonSerialization['stylistId']),
      customerId: serializationManager
          .deserialize<int?>(jsonSerialization['customerId']),
      searchTerm: serializationManager
          .deserialize<String?>(jsonSerialization['searchTerm']),
    );
  }

  static final t = BeautyStyleTable();

  String name;

  String category;

  String? description;

  String cityName;

  String neighbourhoodName;

  String? dateAdded;

  double? amount;

  List<_i2.Images> images;

  List<_i2.Tag>? tags;

  List<_i2.Share>? shares;

  int? stylistId;

  int? customerId;

  String? searchTerm;

  @override
  String get tableName => 'beauty_style';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'dateAdded': dateAdded,
      'amount': amount,
      'images': images,
      'tags': tags,
      'shares': shares,
      'stylistId': stylistId,
      'customerId': customerId,
      'searchTerm': searchTerm,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'dateAdded': dateAdded,
      'amount': amount,
      'images': images,
      'tags': tags,
      'shares': shares,
      'stylistId': stylistId,
      'customerId': customerId,
      'searchTerm': searchTerm,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'dateAdded': dateAdded,
      'amount': amount,
      'images': images,
      'tags': tags,
      'shares': shares,
      'stylistId': stylistId,
      'customerId': customerId,
      'searchTerm': searchTerm,
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
      case 'name':
        name = value;
        return;
      case 'category':
        category = value;
        return;
      case 'description':
        description = value;
        return;
      case 'cityName':
        cityName = value;
        return;
      case 'neighbourhoodName':
        neighbourhoodName = value;
        return;
      case 'dateAdded':
        dateAdded = value;
        return;
      case 'amount':
        amount = value;
        return;
      case 'images':
        images = value;
        return;
      case 'tags':
        tags = value;
        return;
      case 'shares':
        shares = value;
        return;
      case 'stylistId':
        stylistId = value;
        return;
      case 'customerId':
        customerId = value;
        return;
      case 'searchTerm':
        searchTerm = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<BeautyStyle>> find(
    _i1.Session session, {
    BeautyStyleExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BeautyStyle>(
      where: where != null ? where(BeautyStyle.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BeautyStyle?> findSingleRow(
    _i1.Session session, {
    BeautyStyleExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<BeautyStyle>(
      where: where != null ? where(BeautyStyle.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BeautyStyle?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<BeautyStyle>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required BeautyStyleExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BeautyStyle>(
      where: where(BeautyStyle.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    BeautyStyle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    BeautyStyle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    BeautyStyle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    BeautyStyleExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BeautyStyle>(
      where: where != null ? where(BeautyStyle.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef BeautyStyleExpressionBuilder = _i1.Expression Function(
    BeautyStyleTable);

class BeautyStyleTable extends _i1.Table {
  BeautyStyleTable() : super(tableName: 'beauty_style');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final category = _i1.ColumnString('category');

  final description = _i1.ColumnString('description');

  final cityName = _i1.ColumnString('cityName');

  final neighbourhoodName = _i1.ColumnString('neighbourhoodName');

  final dateAdded = _i1.ColumnString('dateAdded');

  final amount = _i1.ColumnDouble('amount');

  final images = _i1.ColumnSerializable('images');

  final tags = _i1.ColumnSerializable('tags');

  final shares = _i1.ColumnSerializable('shares');

  final stylistId = _i1.ColumnInt('stylistId');

  final customerId = _i1.ColumnInt('customerId');

  final searchTerm = _i1.ColumnString('searchTerm');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        category,
        description,
        cityName,
        neighbourhoodName,
        dateAdded,
        amount,
        images,
        tags,
        shares,
        stylistId,
        customerId,
        searchTerm,
      ];
}

@Deprecated('Use BeautyStyleTable.t instead.')
BeautyStyleTable tBeautyStyle = BeautyStyleTable();
