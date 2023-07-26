/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class BookingOrderChat extends _i1.SerializableEntity {
  BookingOrderChat({
    this.id,
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
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

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
}
