import 'dart:async';

import 'package:expense_tracker/core/utils/api_error_response_model.dart';

class ExceptionModel {
  final Exception exceptionType;
  final String? errorMsg;
  final String? exceptionMsg;

  const ExceptionModel(this.errorMsg, this.exceptionMsg,
      {required this.exceptionType});
}

ApiErrorResponse getExceptionErrorResp(Exception exceptionType) {
  if (exceptionType is TimeoutException) {
    return const ApiErrorResponse(
        errorCode: 504,
        errorMessage: "Request timed out.",
        errorDescription: "error");
  } else if (exceptionType is FormatException) {
    return const ApiErrorResponse(
        errorCode: 400,
        errorMessage: "Invalid format.",
        errorDescription: "error");
  } else {
    return const ApiErrorResponse(
        errorCode: 500,
        errorMessage: "An unknown error occurred.",
        errorDescription: "error");
  }
}
