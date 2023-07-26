/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class SaleOrder extends _i1.TableRow {
  SaleOrder({
    int? id,
    required this.bookingOrderId,
    required this.orderType,
    required this.orderedItem,
    this.orderCreatedDate,
    this.orderCornfirmedDate,
    required this.orderBookedTime,
    required this.orderBookedDate,
    required this.customer,
    required this.orderingFor,
    required this.vendor,
    required this.customerId,
    required this.vendorId,
    this.customerRating,
    this.stylistRating,
    this.searchTerm,
    this.orderStatus,
  }) : super(id);

  factory SaleOrder.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SaleOrder(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      bookingOrderId: serializationManager
          .deserialize<int>(jsonSerialization['bookingOrderId']),
      orderType: serializationManager
          .deserialize<String>(jsonSerialization['orderType']),
      orderedItem: serializationManager
          .deserialize<_i2.BeautyStyle>(jsonSerialization['orderedItem']),
      orderCreatedDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['orderCreatedDate']),
      orderCornfirmedDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['orderCornfirmedDate']),
      orderBookedTime: serializationManager
          .deserialize<String>(jsonSerialization['orderBookedTime']),
      orderBookedDate: serializationManager
          .deserialize<String>(jsonSerialization['orderBookedDate']),
      customer: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['customer']),
      orderingFor: serializationManager
          .deserialize<String>(jsonSerialization['orderingFor']),
      vendor: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['vendor']),
      customerId: serializationManager
          .deserialize<int>(jsonSerialization['customerId']),
      vendorId:
          serializationManager.deserialize<int>(jsonSerialization['vendorId']),
      customerRating: serializationManager
          .deserialize<String?>(jsonSerialization['customerRating']),
      stylistRating: serializationManager
          .deserialize<String?>(jsonSerialization['stylistRating']),
      searchTerm: serializationManager
          .deserialize<String?>(jsonSerialization['searchTerm']),
      orderStatus: serializationManager
          .deserialize<String?>(jsonSerialization['orderStatus']),
    );
  }

  static final t = SaleOrderTable();

  int bookingOrderId;

  String orderType;

  _i2.BeautyStyle orderedItem;

  DateTime? orderCreatedDate;

  DateTime? orderCornfirmedDate;

  String orderBookedTime;

  String orderBookedDate;

  _i2.Person customer;

  String orderingFor;

  _i2.Person vendor;

  int customerId;

  int vendorId;

  String? customerRating;

  String? stylistRating;

  String? searchTerm;

  String? orderStatus;

  @override
  String get tableName => 'sale_order';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingOrderId': bookingOrderId,
      'orderType': orderType,
      'orderedItem': orderedItem,
      'orderCreatedDate': orderCreatedDate,
      'orderCornfirmedDate': orderCornfirmedDate,
      'orderBookedTime': orderBookedTime,
      'orderBookedDate': orderBookedDate,
      'customer': customer,
      'orderingFor': orderingFor,
      'vendor': vendor,
      'customerId': customerId,
      'vendorId': vendorId,
      'customerRating': customerRating,
      'stylistRating': stylistRating,
      'searchTerm': searchTerm,
      'orderStatus': orderStatus,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'bookingOrderId': bookingOrderId,
      'orderType': orderType,
      'orderedItem': orderedItem,
      'orderCreatedDate': orderCreatedDate,
      'orderCornfirmedDate': orderCornfirmedDate,
      'orderBookedTime': orderBookedTime,
      'orderBookedDate': orderBookedDate,
      'customer': customer,
      'orderingFor': orderingFor,
      'vendor': vendor,
      'customerId': customerId,
      'vendorId': vendorId,
      'customerRating': customerRating,
      'stylistRating': stylistRating,
      'searchTerm': searchTerm,
      'orderStatus': orderStatus,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'bookingOrderId': bookingOrderId,
      'orderType': orderType,
      'orderedItem': orderedItem,
      'orderCreatedDate': orderCreatedDate,
      'orderCornfirmedDate': orderCornfirmedDate,
      'orderBookedTime': orderBookedTime,
      'orderBookedDate': orderBookedDate,
      'customer': customer,
      'orderingFor': orderingFor,
      'vendor': vendor,
      'customerId': customerId,
      'vendorId': vendorId,
      'customerRating': customerRating,
      'stylistRating': stylistRating,
      'searchTerm': searchTerm,
      'orderStatus': orderStatus,
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
      case 'bookingOrderId':
        bookingOrderId = value;
        return;
      case 'orderType':
        orderType = value;
        return;
      case 'orderedItem':
        orderedItem = value;
        return;
      case 'orderCreatedDate':
        orderCreatedDate = value;
        return;
      case 'orderCornfirmedDate':
        orderCornfirmedDate = value;
        return;
      case 'orderBookedTime':
        orderBookedTime = value;
        return;
      case 'orderBookedDate':
        orderBookedDate = value;
        return;
      case 'customer':
        customer = value;
        return;
      case 'orderingFor':
        orderingFor = value;
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
      case 'customerRating':
        customerRating = value;
        return;
      case 'stylistRating':
        stylistRating = value;
        return;
      case 'searchTerm':
        searchTerm = value;
        return;
      case 'orderStatus':
        orderStatus = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<SaleOrder>> find(
    _i1.Session session, {
    SaleOrderExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SaleOrder>(
      where: where != null ? where(SaleOrder.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<SaleOrder?> findSingleRow(
    _i1.Session session, {
    SaleOrderExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<SaleOrder>(
      where: where != null ? where(SaleOrder.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<SaleOrder?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<SaleOrder>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required SaleOrderExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SaleOrder>(
      where: where(SaleOrder.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    SaleOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    SaleOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    SaleOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    SaleOrderExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SaleOrder>(
      where: where != null ? where(SaleOrder.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef SaleOrderExpressionBuilder = _i1.Expression Function(SaleOrderTable);

class SaleOrderTable extends _i1.Table {
  SaleOrderTable() : super(tableName: 'sale_order');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final bookingOrderId = _i1.ColumnInt('bookingOrderId');

  final orderType = _i1.ColumnString('orderType');

  final orderedItem = _i1.ColumnSerializable('orderedItem');

  final orderCreatedDate = _i1.ColumnDateTime('orderCreatedDate');

  final orderCornfirmedDate = _i1.ColumnDateTime('orderCornfirmedDate');

  final orderBookedTime = _i1.ColumnString('orderBookedTime');

  final orderBookedDate = _i1.ColumnString('orderBookedDate');

  final customer = _i1.ColumnSerializable('customer');

  final orderingFor = _i1.ColumnString('orderingFor');

  final vendor = _i1.ColumnSerializable('vendor');

  final customerId = _i1.ColumnInt('customerId');

  final vendorId = _i1.ColumnInt('vendorId');

  final customerRating = _i1.ColumnString('customerRating');

  final stylistRating = _i1.ColumnString('stylistRating');

  final searchTerm = _i1.ColumnString('searchTerm');

  final orderStatus = _i1.ColumnString('orderStatus');

  @override
  List<_i1.Column> get columns => [
        id,
        bookingOrderId,
        orderType,
        orderedItem,
        orderCreatedDate,
        orderCornfirmedDate,
        orderBookedTime,
        orderBookedDate,
        customer,
        orderingFor,
        vendor,
        customerId,
        vendorId,
        customerRating,
        stylistRating,
        searchTerm,
        orderStatus,
      ];
}

@Deprecated('Use SaleOrderTable.t instead.')
SaleOrderTable tSaleOrder = SaleOrderTable();
