/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class BookingOrder extends _i1.SerializableEntity {
  BookingOrder({
    this.id,
    required this.selectedDate,
    required this.selectedTime,
    this.orderStatus,
    required this.customerId,
    required this.customerType,
    required this.vendorId,
    required this.beautyStyleId,
    this.dateCreated,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String selectedDate;

  String selectedTime;

  String? orderStatus;

  int customerId;

  String customerType;

  int vendorId;

  int beautyStyleId;

  DateTime? dateCreated;

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
}
