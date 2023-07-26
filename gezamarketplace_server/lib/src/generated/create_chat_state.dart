/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class ChatMessageCreateMessage extends _i1.SerializableEntity {
  ChatMessageCreateMessage({
    required this.bookingChatId,
    required this.senderId,
    required this.sender,
    required this.recieverId,
    required this.reciever,
    required this.message,
    required this.dateCreated,
  });

  factory ChatMessageCreateMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ChatMessageCreateMessage(
      bookingChatId: serializationManager
          .deserialize<int>(jsonSerialization['bookingChatId']),
      senderId:
          serializationManager.deserialize<int>(jsonSerialization['senderId']),
      sender: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['sender']),
      recieverId: serializationManager
          .deserialize<int>(jsonSerialization['recieverId']),
      reciever: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['reciever']),
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      dateCreated: serializationManager
          .deserialize<DateTime>(jsonSerialization['dateCreated']),
    );
  }

  int bookingChatId;

  int senderId;

  _i2.Person sender;

  int recieverId;

  _i2.Person reciever;

  String message;

  DateTime dateCreated;

  @override
  Map<String, dynamic> toJson() {
    return {
      'bookingChatId': bookingChatId,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
      'dateCreated': dateCreated,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'bookingChatId': bookingChatId,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
      'dateCreated': dateCreated,
    };
  }
}
