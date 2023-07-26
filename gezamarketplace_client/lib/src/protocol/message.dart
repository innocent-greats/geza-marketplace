/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Message extends _i1.SerializableEntity {
  Message({
    this.id,
    required this.topicId,
    required this.topic,
    this.createdDate,
    required this.senderId,
    required this.sender,
    required this.recieverId,
    required this.reciever,
    required this.message,
  });

  factory Message.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Message(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      topicId:
          serializationManager.deserialize<int>(jsonSerialization['topicId']),
      topic:
          serializationManager.deserialize<String>(jsonSerialization['topic']),
      createdDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['createdDate']),
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
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int topicId;

  String topic;

  DateTime? createdDate;

  int senderId;

  _i2.Person sender;

  int recieverId;

  _i2.Person reciever;

  String message;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topicId': topicId,
      'topic': topic,
      'createdDate': createdDate,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
    };
  }
}
