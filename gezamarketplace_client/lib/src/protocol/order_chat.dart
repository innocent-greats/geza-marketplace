/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class OrderChat extends _i1.SerializableEntity {
  OrderChat({
    this.id,
    this.dateCreated,
    required this.order,
    required this.messages,
  });

  factory OrderChat.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return OrderChat(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateCreated: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateCreated']),
      order: serializationManager
          .deserialize<_i2.SaleOrder>(jsonSerialization['order']),
      messages: serializationManager
          .deserialize<List<_i2.Message>>(jsonSerialization['messages']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime? dateCreated;

  _i2.SaleOrder order;

  List<_i2.Message> messages;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated,
      'order': order,
      'messages': messages,
    };
  }
}
