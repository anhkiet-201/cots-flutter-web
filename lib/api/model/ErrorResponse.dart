class ErrorResponse implements Exception {
  final int statusCode;
  final String? description;
  final List<dynamic>? error;
  const ErrorResponse(this.statusCode, this.description, this.error);
}