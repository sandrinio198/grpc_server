import 'dart:convert';

class FailedResponse<T> {
  final String status;
  final String message;
  final T? data;

  FailedResponse({
    this.status = 'failed',
    required this.message,
    this.data,
  });

  // Convert SuccessResponse to JSON format
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }

  // Convert JSON string from SuccessResponse
  String toRawJson() => jsonEncode(toJson());
}
