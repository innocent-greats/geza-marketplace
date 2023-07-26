/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class BeautyStyleCreateMessage extends _i1.SerializableEntity {
  BeautyStyleCreateMessage({
    required this.name,
    required this.category,
    this.description,
    required this.cityName,
    required this.neighbourhoodName,
    this.dateAdded,
    this.amount,
    required this.images,
    this.stylistId,
  });

  factory BeautyStyleCreateMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BeautyStyleCreateMessage(
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      cityName: serializationManager
          .deserialize<String>(jsonSerialization['cityName']),
      neighbourhoodName: serializationManager
          .deserialize<String>(jsonSerialization['neighbourhoodName']),
      dateAdded: serializationManager
          .deserialize<DateTime?>(jsonSerialization['dateAdded']),
      amount: serializationManager
          .deserialize<double?>(jsonSerialization['amount']),
      images: serializationManager
          .deserialize<List<_i2.Images>>(jsonSerialization['images']),
      stylistId: serializationManager
          .deserialize<int?>(jsonSerialization['stylistId']),
    );
  }

  String name;

  String category;

  String? description;

  String cityName;

  String neighbourhoodName;

  DateTime? dateAdded;

  double? amount;

  List<_i2.Images> images;

  int? stylistId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'dateAdded': dateAdded,
      'amount': amount,
      'images': images,
      'stylistId': stylistId,
    };
  }
}
