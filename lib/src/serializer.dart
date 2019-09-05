import 'package:codable/src/deserializable.dart';
import 'package:codable/src/serializable.dart';

abstract class Serializer<From, To>
    implements Deserializable<From, To>, Serializable<From, To> {}
