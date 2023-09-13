class ErrorResponse {
  final int statusCode;
  final String? description;
  final List<String>? error;
  const ErrorResponse(this.statusCode, this.description, this.error);
}