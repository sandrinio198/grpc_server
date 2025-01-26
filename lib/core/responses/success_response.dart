import 'dart:convert';

class SuccessResponse<T> {
  final String status;
  final String message;
  final T? data;

  SuccessResponse({
    this.status = 'success',
    required this.message,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }

  String toRawJson() => jsonEncode(toJson());
}
