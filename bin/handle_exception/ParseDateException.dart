class ParseDateException implements Exception {
  final String message;

  ParseDateException(this.message);

  @override
  String toString() {
    return 'ParseDateException: $message';
  }
}
