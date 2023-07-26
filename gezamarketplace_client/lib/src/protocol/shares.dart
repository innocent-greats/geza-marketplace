/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Share extends _i1.SerializableEntity {
  Share({
    this.id,
    this.dateAdded,
    required this.stylistId,
    this.beautyStyleId,
    this.shareBy,
    this.sharewith,
  });

  factory Share.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Share(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateAdded: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateAdded']),
      stylistId:
          serializationManager.deserialize<int>(jsonSerialization['stylistId']),
      beautyStyleId: serializationManager
          .deserialize<int?>(jsonSerialization['beautyStyleId']),
      shareBy:
          serializationManager.deserialize<int?>(jsonSerialization['shareBy']),
      sharewith: serializationManager
          .deserialize<int?>(jsonSerialization['sharewith']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime? dateAdded;

  int stylistId;

  int? beautyStyleId;

  int? shareBy;

  int? sharewith;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateAdded': dateAdded,
      'stylistId': stylistId,
      'beautyStyleId': beautyStyleId,
      'shareBy': shareBy,
      'sharewith': sharewith,
    };
  }
}
