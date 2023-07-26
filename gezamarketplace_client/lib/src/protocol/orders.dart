/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class SaleOrder extends _i1.SerializableEntity {
  SaleOrder({
    this.id,
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
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

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
}
