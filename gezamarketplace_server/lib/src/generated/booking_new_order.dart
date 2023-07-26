/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class BookingOrderCreateMessage extends _i1.SerializableEntity {
  BookingOrderCreateMessage({
    required this.selectedDate,
    required this.selectedTime,
    required this.customerId,
    required this.customerType,
    required this.vendorId,
    required this.beautyStyleId,
    this.dateCreated,
  });

  factory BookingOrderCreateMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BookingOrderCreateMessage(
      selectedDate: serializationManager
          .deserialize<String>(jsonSerialization['selectedDate']),
      selectedTime: serializationManager
          .deserialize<String>(jsonSerialization['selectedTime']),
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

  String selectedDate;

  String selectedTime;

  int customerId;

  String customerType;

  int vendorId;

  int beautyStyleId;

  DateTime? dateCreated;

  @override
  Map<String, dynamic> toJson() {
    return {
      'selectedDate': selectedDate,
      'selectedTime': selectedTime,
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
      'selectedDate': selectedDate,
      'selectedTime': selectedTime,
      'customerId': customerId,
      'customerType': customerType,
      'vendorId': vendorId,
      'beautyStyleId': beautyStyleId,
      'dateCreated': dateCreated,
    };
  }
}
