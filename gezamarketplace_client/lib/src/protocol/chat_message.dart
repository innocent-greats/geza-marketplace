/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class ChatMessage extends _i1.SerializableEntity {
  ChatMessage({
    this.id,
    required this.bookingChatId,
    required this.senderId,
    required this.sender,
    required this.recieverId,
    required this.reciever,
    required this.message,
    required this.dateCreated,
  });

  factory ChatMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ChatMessage(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

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
      'id': id,
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
