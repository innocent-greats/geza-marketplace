/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Tag extends _i1.SerializableEntity {
  Tag({
    this.id,
    this.dateAdded,
    required this.stylistId,
    this.beautyStyleId,
    this.personTaggedId,
  });

  factory Tag.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Tag(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateAdded: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateAdded']),
      stylistId:
          serializationManager.deserialize<int>(jsonSerialization['stylistId']),
      beautyStyleId: serializationManager
          .deserialize<int?>(jsonSerialization['beautyStyleId']),
      personTaggedId: serializationManager
          .deserialize<int?>(jsonSerialization['personTaggedId']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime? dateAdded;

  int stylistId;

  int? beautyStyleId;

  int? personTaggedId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'stylistId': stylistId,
      'beautyStyleId': beautyStyleId,
      'personTaggedId': personTaggedId,
    };
  }
}
