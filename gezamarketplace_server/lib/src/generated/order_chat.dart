/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class OrderChat extends _i1.TableRow {
  OrderChat({
    int? id,
    this.dateCreated,
    required this.order,
    required this.messages,
  }) : super(id);

  factory OrderChat.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return OrderChat(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateCreated: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateCreated']),
      order: serializationManager
          .deserialize<_i2.SaleOrder>(jsonSerialization['order']),
      messages: serializationManager
          .deserialize<List<_i2.Message>>(jsonSerialization['messages']),
    );
  }

  static final t = OrderChatTable();

  DateTime? dateCreated;

  _i2.SaleOrder order;

  List<_i2.Message> messages;

  @override
  String get tableName => 'order_chat';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated,
      'order': order,
      'messages': messages,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'dateCreated': dateCreated,
      'order': order,
      'messages': messages,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'dateCreated': dateCreated,
      'order': order,
      'messages': messages,
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
      case 'dateCreated':
        dateCreated = value;
        return;
      case 'order':
        order = value;
        return;
      case 'messages':
        messages = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<OrderChat>> find(
    _i1.Session session, {
    OrderChatExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<OrderChat>(
      where: where != null ? where(OrderChat.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<OrderChat?> findSingleRow(
    _i1.Session session, {
    OrderChatExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<OrderChat>(
      where: where != null ? where(OrderChat.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<OrderChat?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<OrderChat>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required OrderChatExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderChat>(
      where: where(OrderChat.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    OrderChat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    OrderChat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    OrderChat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    OrderChatExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderChat>(
      where: where != null ? where(OrderChat.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef OrderChatExpressionBuilder = _i1.Expression Function(OrderChatTable);

class OrderChatTable extends _i1.Table {
  OrderChatTable() : super(tableName: 'order_chat');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final dateCreated = _i1.ColumnDateTime('dateCreated');

  final order = _i1.ColumnSerializable('order');

  final messages = _i1.ColumnSerializable('messages');

  @override
  List<_i1.Column> get columns => [
        id,
        dateCreated,
        order,
        messages,
      ];
}

@Deprecated('Use OrderChatTable.t instead.')
OrderChatTable tOrderChat = OrderChatTable();
