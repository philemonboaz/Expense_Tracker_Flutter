import 'package:expense_tracker/core/utils/api_error_response_model.dart';

class BaseApiResponse<T> {
  final String status;
  final String message;
  final T? data;
  final ApiErrorResponse? error;

  BaseApiResponse(
      {required this.status,
      required this.message,
      required this.data,
      this.error});

  factory BaseApiResponse.fromJson(Map<String, dynamic> json) {
    return BaseApiResponse(
      status: json["status"],
      message: json['message'],
      data: (json['data'] != null && json['data'] != "") ? json['data'] : null,
      error: (json['error'] != null && json['error'] != "")
          ? ApiErrorResponse.fromJson(json['error'])
          : null,
    );
  }
}
