/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class BookingOrderAppendMessage extends _i1.SerializableEntity {
  BookingOrderAppendMessage({required this.bookingOrder});

  factory BookingOrderAppendMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BookingOrderAppendMessage(
        bookingOrder: serializationManager
            .deserialize<_i2.BookingOrder>(jsonSerialization['bookingOrder']));
  }

  _i2.BookingOrder bookingOrder;

  @override
  Map<String, dynamic> toJson() {
    return {'bookingOrder': bookingOrder};
  }

  @override
  Map<String, dynamic> allToJson() {
    return {'bookingOrder': bookingOrder};
  }
}
