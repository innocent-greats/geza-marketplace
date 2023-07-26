/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class OrderMessage extends _i1.SerializableEntity {
  OrderMessage({
    this.id,
    this.createdDate,
    required this.orderType,
    required this.orderId,
    required this.essage,
  });

  factory OrderMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return OrderMessage(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      createdDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['createdDate']),
      orderType: serializationManager
          .deserialize<String>(jsonSerialization['orderType']),
      orderId:
          serializationManager.deserialize<int>(jsonSerialization['orderId']),
      essage: serializationManager
          .deserialize<_i2.Message>(jsonSerialization['essage']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime? createdDate;

  String orderType;

  int orderId;

  _i2.Message essage;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdDate': createdDate,
      'orderType': orderType,
      'orderId': orderId,
      'essage': essage,
    };
  }
}
