/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class BeautyStyleAppendMessage extends _i1.SerializableEntity {
  BeautyStyleAppendMessage({required this.beautyStyle});

  factory BeautyStyleAppendMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BeautyStyleAppendMessage(
        beautyStyle: serializationManager
            .deserialize<_i2.BeautyStyle>(jsonSerialization['beautyStyle']));
  }

  _i2.BeautyStyle beautyStyle;

  @override
  Map<String, dynamic> toJson() {
    return {'beautyStyle': beautyStyle};
  }

  @override
  Map<String, dynamic> allToJson() {
    return {'beautyStyle': beautyStyle};
  }
}
