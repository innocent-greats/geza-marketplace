/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class BeautyStylistsState extends _i1.SerializableEntity {
  BeautyStylistsState({
    required this.stylist,
    required this.beautyStyles,
  });

  factory BeautyStylistsState.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BeautyStylistsState(
      stylist: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['stylist']),
      beautyStyles: serializationManager.deserialize<List<_i2.BeautyStyle>>(
          jsonSerialization['beautyStyles']),
    );
  }

  _i2.Person stylist;

  List<_i2.BeautyStyle> beautyStyles;

  @override
  Map<String, dynamic> toJson() {
    return {
      'stylist': stylist,
      'beautyStyles': beautyStyles,
    };
  }
}
