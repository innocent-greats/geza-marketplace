/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class BookingOrderChatAppendMessage extends _i1.SerializableEntity {
  BookingOrderChatAppendMessage({required this.bookingOrderChat});

  factory BookingOrderChatAppendMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BookingOrderChatAppendMessage(
        bookingOrderChat:
            serializationManager.deserialize<_i2.BookingOrderChat>(
                jsonSerialization['bookingOrderChat']));
  }

  _i2.BookingOrderChat bookingOrderChat;

  @override
  Map<String, dynamic> toJson() {
    return {'bookingOrderChat': bookingOrderChat};
  }

  @override
  Map<String, dynamic> allToJson() {
    return {'bookingOrderChat': bookingOrderChat};
  }
}
