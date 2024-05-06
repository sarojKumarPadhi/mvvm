class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataExceptions extends AppException {
  FetchDataExceptions([String? message])
      : super(message, "Error During Communication");
}

class BadRequestExceptions extends AppException {
  BadRequestExceptions([String? message]) : super(message, "Invalid request");
}

class UnauthorisedExceptions extends AppException {
  UnauthorisedExceptions([String? message])
      : super(message, "Unauthorised request");
}

class InvalidInputExceptions extends AppException {
  InvalidInputExceptions([String? message])
      : super(message, "Unauthorised request");
}
