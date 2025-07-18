import 'package:expense_tracker/core/constants/constant_enums.dart';
import 'package:expense_tracker/core/utils/api_error_response_model.dart';

class BaseApiResponse<T> {
  final Status status;
  final int statusCode;
  final String message;
  final T? data;
  final ApiErrorResponse? error;
  static final errorCodes = {400, 404, 500, 502, 504};

  BaseApiResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data,
      this.error});

  factory BaseApiResponse.fromJson(Map<String, dynamic> json) {
    return BaseApiResponse(
      status: getStatusEnum(json['statusCode']),
      statusCode: json['statusCode'],
      message: json['message'],
      data: (json['data'] != null && json['data'] != "") ? json['data'] : null,
      error: (json['error'] != null && json['error'] != "")
          ? ApiErrorResponse.fromJson(json['error'])
          : null,
    );
  }

  static Status getStatusEnum(int statusCode) {
    if (statusCode == 200) return Status.success;
    if (statusCode == 409) return Status.exception;
    if (errorCodes.contains(statusCode)) return Status.error;

    return Status.success;
  }
}
