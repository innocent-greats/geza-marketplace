/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class OrderMessage extends _i1.TableRow {
  OrderMessage({
    int? id,
    this.createdDate,
    required this.orderType,
    required this.orderId,
    required this.essage,
  }) : super(id);

  factory OrderMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return OrderMessage(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      createdDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['createdDate']),
      orderType: serializationManager
          .deserialize<String>(jsonSerialization['orderType']),
      orderId:
          serializationManager.deserialize<int>(jsonSerialization['orderId']),
      essage: serializationManager
          .deserialize<_i2.Message>(jsonSerialization['essage']),
    );
  }

  static final t = OrderMessageTable();

  DateTime? createdDate;

  String orderType;

  int orderId;

  _i2.Message essage;

  @override
  String get tableName => 'order_message';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdDate': createdDate,
      'orderType': orderType,
      'orderId': orderId,
      'essage': essage,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'createdDate': createdDate,
      'orderType': orderType,
      'orderId': orderId,
      'essage': essage,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'createdDate': createdDate,
      'orderType': orderType,
      'orderId': orderId,
      'essage': essage,
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
      case 'createdDate':
        createdDate = value;
        return;
      case 'orderType':
        orderType = value;
        return;
      case 'orderId':
        orderId = value;
        return;
      case 'essage':
        essage = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<OrderMessage>> find(
    _i1.Session session, {
    OrderMessageExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<OrderMessage>(
      where: where != null ? where(OrderMessage.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<OrderMessage?> findSingleRow(
    _i1.Session session, {
    OrderMessageExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<OrderMessage>(
      where: where != null ? where(OrderMessage.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<OrderMessage?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<OrderMessage>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required OrderMessageExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderMessage>(
      where: where(OrderMessage.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    OrderMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    OrderMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    OrderMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    OrderMessageExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderMessage>(
      where: where != null ? where(OrderMessage.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef OrderMessageExpressionBuilder = _i1.Expression Function(
    OrderMessageTable);

class OrderMessageTable extends _i1.Table {
  OrderMessageTable() : super(tableName: 'order_message');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final createdDate = _i1.ColumnDateTime('createdDate');

  final orderType = _i1.ColumnString('orderType');

  final orderId = _i1.ColumnInt('orderId');

  final essage = _i1.ColumnSerializable('essage');

  @override
  List<_i1.Column> get columns => [
        id,
        createdDate,
        orderType,
        orderId,
        essage,
      ];
}

@Deprecated('Use OrderMessageTable.t instead.')
OrderMessageTable tOrderMessage = OrderMessageTable();
