class MissingSerializerException implements Exception {
  final String message;

  MissingSerializerException(this.message);

  @override
  String toString() => 'MissingSerializerException{message: $message}';
}
