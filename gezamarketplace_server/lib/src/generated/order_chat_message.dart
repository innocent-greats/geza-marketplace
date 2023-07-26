/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class OrderChatAppendMessage extends _i1.SerializableEntity {
  OrderChatAppendMessage({required this.chatMessage});

  factory OrderChatAppendMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return OrderChatAppendMessage(
        chatMessage: serializationManager
            .deserialize<_i2.ChatMessage>(jsonSerialization['chatMessage']));
  }

  _i2.ChatMessage chatMessage;

  @override
  Map<String, dynamic> toJson() {
    return {'chatMessage': chatMessage};
  }

  @override
  Map<String, dynamic> allToJson() {
    return {'chatMessage': chatMessage};
  }
}
