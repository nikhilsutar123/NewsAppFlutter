class AppException implements Exception {
  final String message;
  final String? prefix;
  final String? url;

  AppException(this.message, {this.prefix, this.url});

  @override
  String toString() {
    return "${prefix ?? ''}$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message ?? "Error during communication",
            prefix: "Fetch Data Error: ", url: url);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message ?? "Invalid Request", prefix: "Bad Request: ", url: url);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message, String? url])
      : super(message ?? "Unauthorized access",
            prefix: "Unauthorized request: ", url: url);
}
