/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Location extends _i1.SerializableEntity {
  Location({
    this.id,
    required this.cityName,
    required this.neighbourhoodName,
    required this.mapName,
    required this.lat,
    required this.long,
  });

  factory Location.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Location(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      cityName: serializationManager
          .deserialize<String>(jsonSerialization['cityName']),
      neighbourhoodName: serializationManager
          .deserialize<String>(jsonSerialization['neighbourhoodName']),
      mapName: serializationManager
          .deserialize<String>(jsonSerialization['mapName']),
      lat: serializationManager.deserialize<String>(jsonSerialization['lat']),
      long: serializationManager.deserialize<String>(jsonSerialization['long']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String cityName;

  String neighbourhoodName;

  String mapName;

  String lat;

  String long;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'mapName': mapName,
      'lat': lat,
      'long': long,
    };
  }
}
