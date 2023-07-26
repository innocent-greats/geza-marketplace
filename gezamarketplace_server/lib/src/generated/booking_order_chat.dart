/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class BookingOrderChat extends _i1.TableRow {
  BookingOrderChat({
    int? id,
    required this.orderedItem,
    this.chatDate,
    this.orderDate,
    required this.orderId,
    required this.customer,
    required this.vendor,
    required this.customerId,
    required this.vendorId,
    required this.messages,
    this.chatStatus,
  }) : super(id);

  factory BookingOrderChat.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BookingOrderChat(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      orderedItem: serializationManager
          .deserialize<_i2.BeautyStyle>(jsonSerialization['orderedItem']),
      chatDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['chatDate']),
      orderDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['orderDate']),
      orderId:
          serializationManager.deserialize<int>(jsonSerialization['orderId']),
      customer: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['customer']),
      vendor: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['vendor']),
      customerId: serializationManager
          .deserialize<int>(jsonSerialization['customerId']),
      vendorId:
          serializationManager.deserialize<int>(jsonSerialization['vendorId']),
      messages: serializationManager
          .deserialize<List<_i2.BookingMessage>>(jsonSerialization['messages']),
      chatStatus: serializationManager
          .deserialize<String?>(jsonSerialization['chatStatus']),
    );
  }

  static final t = BookingOrderChatTable();

  _i2.BeautyStyle orderedItem;

  DateTime? chatDate;

  DateTime? orderDate;

  int orderId;

  _i2.Person customer;

  _i2.Person vendor;

  int customerId;

  int vendorId;

  List<_i2.BookingMessage> messages;

  String? chatStatus;

  @override
  String get tableName => 'booking_order_chat';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderedItem': orderedItem,
      'chatDate': chatDate,
      'orderDate': orderDate,
      'orderId': orderId,
      'customer': customer,
      'vendor': vendor,
      'customerId': customerId,
      'vendorId': vendorId,
      'messages': messages,
      'chatStatus': chatStatus,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'orderedItem': orderedItem,
      'chatDate': chatDate,
      'orderDate': orderDate,
      'orderId': orderId,
      'customer': customer,
      'vendor': vendor,
      'customerId': customerId,
      'vendorId': vendorId,
      'messages': messages,
      'chatStatus': chatStatus,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'orderedItem': orderedItem,
      'chatDate': chatDate,
      'orderDate': orderDate,
      'orderId': orderId,
      'customer': customer,
      'vendor': vendor,
      'customerId': customerId,
      'vendorId': vendorId,
      'messages': messages,
      'chatStatus': chatStatus,
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
      case 'orderedItem':
        orderedItem = value;
        return;
      case 'chatDate':
        chatDate = value;
        return;
      case 'orderDate':
        orderDate = value;
        return;
      case 'orderId':
        orderId = value;
        return;
      case 'customer':
        customer = value;
        return;
      case 'vendor':
        vendor = value;
        return;
      case 'customerId':
        customerId = value;
        return;
      case 'vendorId':
        vendorId = value;
        return;
      case 'messages':
        messages = value;
        return;
      case 'chatStatus':
        chatStatus = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<BookingOrderChat>> find(
    _i1.Session session, {
    BookingOrderChatExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BookingOrderChat>(
      where: where != null ? where(BookingOrderChat.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BookingOrderChat?> findSingleRow(
    _i1.Session session, {
    BookingOrderChatExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<BookingOrderChat>(
      where: where != null ? where(BookingOrderChat.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BookingOrderChat?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<BookingOrderChat>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required BookingOrderChatExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BookingOrderChat>(
      where: where(BookingOrderChat.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    BookingOrderChat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    BookingOrderChat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    BookingOrderChat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    BookingOrderChatExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BookingOrderChat>(
      where: where != null ? where(BookingOrderChat.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef BookingOrderChatExpressionBuilder = _i1.Expression Function(
    BookingOrderChatTable);

class BookingOrderChatTable extends _i1.Table {
  BookingOrderChatTable() : super(tableName: 'booking_order_chat');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final orderedItem = _i1.ColumnSerializable('orderedItem');

  final chatDate = _i1.ColumnDateTime('chatDate');

  final orderDate = _i1.ColumnDateTime('orderDate');

  final orderId = _i1.ColumnInt('orderId');

  final customer = _i1.ColumnSerializable('customer');

  final vendor = _i1.ColumnSerializable('vendor');

  final customerId = _i1.ColumnInt('customerId');

  final vendorId = _i1.ColumnInt('vendorId');

  final messages = _i1.ColumnSerializable('messages');

  final chatStatus = _i1.ColumnString('chatStatus');

  @override
  List<_i1.Column> get columns => [
        id,
        orderedItem,
        chatDate,
        orderDate,
        orderId,
        customer,
        vendor,
        customerId,
        vendorId,
        messages,
        chatStatus,
      ];
}

@Deprecated('Use BookingOrderChatTable.t instead.')
BookingOrderChatTable tBookingOrderChat = BookingOrderChatTable();
