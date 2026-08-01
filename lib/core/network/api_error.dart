sealed class ApiError implements Exception {
  final String message;
  const ApiError(this.message);

  @override
  String toString() => message;
}

class ServerError extends ApiError {
  const ServerError(super.message);
}

class DecodingError extends ApiError {
  const DecodingError(super.message);
}
