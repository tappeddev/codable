import 'package:codable/codable.dart';
import 'package:test/test.dart';

void main() {
  test("insert and get decoder", () {
    final container = SerializerContainer();
    container.insertDecoder(StringDecoder());
    container.insertDecoder(IntDecoder());

    expect(container.decoderOfType<String>(), TypeMatcher<StringDecoder>());
    expect(container.decoderOfType<int>(), TypeMatcher<IntDecoder>());
  });
}

class StringDecoder implements Serializable<String, String> {
  @override
  String from(String input) => null;
}

class IntDecoder implements Serializable<int, int> {
  @override
  int from(int input) => null;
}
