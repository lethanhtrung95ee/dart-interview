class PageException implements Exception {
  final String message;

  PageException(this.message);

  @override
  String toString() {
    return 'PageException: $message';
  }
}
