/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class BookingOrder extends _i1.TableRow {
  BookingOrder({
    int? id,
    required this.selectedDate,
    required this.selectedTime,
    this.orderStatus,
    required this.customerId,
    required this.customerType,
    required this.vendorId,
    required this.beautyStyleId,
    this.dateCreated,
  }) : super(id);

  factory BookingOrder.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BookingOrder(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      selectedDate: serializationManager
          .deserialize<String>(jsonSerialization['selectedDate']),
      selectedTime: serializationManager
          .deserialize<String>(jsonSerialization['selectedTime']),
      orderStatus: serializationManager
          .deserialize<String?>(jsonSerialization['orderStatus']),
      customerId: serializationManager
          .deserialize<int>(jsonSerialization['customerId']),
      customerType: serializationManager
          .deserialize<String>(jsonSerialization['customerType']),
      vendorId:
          serializationManager.deserialize<int>(jsonSerialization['vendorId']),
      beautyStyleId: serializationManager
          .deserialize<int>(jsonSerialization['beautyStyleId']),
      dateCreated: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateCreated']),
    );
  }

  static final t = BookingOrderTable();

  String selectedDate;

  String selectedTime;

  String? orderStatus;

  int customerId;

  String customerType;

  int vendorId;

  int beautyStyleId;

  DateTime? dateCreated;

  @override
  String get tableName => 'booking_order';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'selectedDate': selectedDate,
      'selectedTime': selectedTime,
      'orderStatus': orderStatus,
      'customerId': customerId,
      'customerType': customerType,
      'vendorId': vendorId,
      'beautyStyleId': beautyStyleId,
      'dateCreated': dateCreated,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'selectedDate': selectedDate,
      'selectedTime': selectedTime,
      'orderStatus': orderStatus,
      'customerId': customerId,
      'customerType': customerType,
      'vendorId': vendorId,
      'beautyStyleId': beautyStyleId,
      'dateCreated': dateCreated,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'selectedDate': selectedDate,
      'selectedTime': selectedTime,
      'orderStatus': orderStatus,
      'customerId': customerId,
      'customerType': customerType,
      'vendorId': vendorId,
      'beautyStyleId': beautyStyleId,
      'dateCreated': dateCreated,
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
      case 'selectedDate':
        selectedDate = value;
        return;
      case 'selectedTime':
        selectedTime = value;
        return;
      case 'orderStatus':
        orderStatus = value;
        return;
      case 'customerId':
        customerId = value;
        return;
      case 'customerType':
        customerType = value;
        return;
      case 'vendorId':
        vendorId = value;
        return;
      case 'beautyStyleId':
        beautyStyleId = value;
        return;
      case 'dateCreated':
        dateCreated = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<BookingOrder>> find(
    _i1.Session session, {
    BookingOrderExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BookingOrder>(
      where: where != null ? where(BookingOrder.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BookingOrder?> findSingleRow(
    _i1.Session session, {
    BookingOrderExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<BookingOrder>(
      where: where != null ? where(BookingOrder.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BookingOrder?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<BookingOrder>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required BookingOrderExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BookingOrder>(
      where: where(BookingOrder.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    BookingOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    BookingOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    BookingOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    BookingOrderExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BookingOrder>(
      where: where != null ? where(BookingOrder.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef BookingOrderExpressionBuilder = _i1.Expression Function(
    BookingOrderTable);

class BookingOrderTable extends _i1.Table {
  BookingOrderTable() : super(tableName: 'booking_order');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final selectedDate = _i1.ColumnString('selectedDate');

  final selectedTime = _i1.ColumnString('selectedTime');

  final orderStatus = _i1.ColumnString('orderStatus');

  final customerId = _i1.ColumnInt('customerId');

  final customerType = _i1.ColumnString('customerType');

  final vendorId = _i1.ColumnInt('vendorId');

  final beautyStyleId = _i1.ColumnInt('beautyStyleId');

  final dateCreated = _i1.ColumnDateTime('dateCreated');

  @override
  List<_i1.Column> get columns => [
        id,
        selectedDate,
        selectedTime,
        orderStatus,
        customerId,
        customerType,
        vendorId,
        beautyStyleId,
        dateCreated,
      ];
}

@Deprecated('Use BookingOrderTable.t instead.')
BookingOrderTable tBookingOrder = BookingOrderTable();
