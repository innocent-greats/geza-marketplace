/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class BeautyStyleStateMessage extends _i1.SerializableEntity {
  BeautyStyleStateMessage({required this.beautyStyles});

  factory BeautyStyleStateMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BeautyStyleStateMessage(
        beautyStyles: serializationManager.deserialize<List<_i2.BeautyStyle>>(
            jsonSerialization['beautyStyles']));
  }

  List<_i2.BeautyStyle> beautyStyles;

  @override
  Map<String, dynamic> toJson() {
    return {'beautyStyles': beautyStyles};
  }
}
