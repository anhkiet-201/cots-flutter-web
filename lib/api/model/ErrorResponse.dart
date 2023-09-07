class ErrorResponse {
  final int statusCode;
  final String? description;
  const ErrorResponse(this.statusCode, this.description);
}