import 'package:codable/src/deserializable.dart';
import 'package:codable/src/serializable.dart';

import 'missing_serializer_exception.dart';

class SerializerContainer {
  final _decoders = Map<String, Serializable>();
  final _encoders = Map<String, Deserializable>();

  Deserializable<Object, T> encodeOfType<T>(Type type) {
    _assertNotDynamic<T>();

    final key = type.hashCode.toString();
    final deserializable = _encoders[key] as Deserializable<Object, T>;
    if (deserializable == null) {
      throw MissingSerializerException(
          "encoding failed since there is not encoder for type \"$T\".");
    }

    return deserializable;
  }

  Serializable<Object, T> decoderOfType<T>() {
    _assertNotDynamic<T>();

    final key = T.hashCode.toString();
    final serializable = _decoders[key] as Serializable<Object, T>;
    if (serializable == null) {
      throw MissingSerializerException(
          "decoding failed since there is not decoder for type \"$T\".");
    }

    return serializable;
  }

  void insertDecoder<T>(Serializable<Object, T> serializable) {
    _assertNotDynamic<T>();

    final key = T.hashCode.toString();
    _decoders[key] = serializable;
  }

  void insertEncoder<T>(Deserializable<Object, T> serializable) {
    _assertNotDynamic<T>();

    final key = T.hashCode.toString();
    _encoders[key] = serializable;
  }

  // ------
  // Helper
  // ------

  void _assertNotDynamic<T>() {
    if (T == dynamic) {
      throw Exception("dynamic not allowed!");
    }
  }
}
