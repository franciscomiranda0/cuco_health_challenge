class RequestException implements Exception {
  final int _code;
  final String _message;

  const RequestException(
    this._code,
    this._message,
  );

  @override
  String toString() {
    return _message;
  }

  int get code => _code;
}
