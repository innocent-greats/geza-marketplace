/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class BeautyStyle extends _i1.SerializableEntity {
  BeautyStyle({
    this.id,
    required this.name,
    required this.category,
    this.description,
    required this.cityName,
    required this.neighbourhoodName,
    this.dateAdded,
    this.amount,
    required this.images,
    this.tags,
    this.shares,
    this.stylistId,
    this.customerId,
    this.searchTerm,
  });

  factory BeautyStyle.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BeautyStyle(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
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
          .deserialize<String?>(jsonSerialization['dateAdded']),
      amount: serializationManager
          .deserialize<double?>(jsonSerialization['amount']),
      images: serializationManager
          .deserialize<List<_i2.Images>>(jsonSerialization['images']),
      tags: serializationManager
          .deserialize<List<_i2.Tag>?>(jsonSerialization['tags']),
      shares: serializationManager
          .deserialize<List<_i2.Share>?>(jsonSerialization['shares']),
      stylistId: serializationManager
          .deserialize<int?>(jsonSerialization['stylistId']),
      customerId: serializationManager
          .deserialize<int?>(jsonSerialization['customerId']),
      searchTerm: serializationManager
          .deserialize<String?>(jsonSerialization['searchTerm']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String category;

  String? description;

  String cityName;

  String neighbourhoodName;

  String? dateAdded;

  double? amount;

  List<_i2.Images> images;

  List<_i2.Tag>? tags;

  List<_i2.Share>? shares;

  int? stylistId;

  int? customerId;

  String? searchTerm;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'dateAdded': dateAdded,
      'amount': amount,
      'images': images,
      'tags': tags,
      'shares': shares,
      'stylistId': stylistId,
      'customerId': customerId,
      'searchTerm': searchTerm,
    };
  }
}
