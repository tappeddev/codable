import 'dart:convert';

import 'package:codable/codable.dart';

mixin DecodeEncodeMixin {
  SerializerContainer get container;

  String encode<T>(T body) {
    final deserializer = container.encodeOfType<T>(body.runtimeType);
    return json.encode(deserializer.to(body));
  }

  T decode<T>(String body) {
    final decodedBody = json.decode(body) as Object;

    final serializable = container.decoderOfType<T>();
    return serializable.from(decodedBody);
  }
}
