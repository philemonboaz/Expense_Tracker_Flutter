import 'package:expense_tracker/core/utils/api_error_response_model.dart';

abstract class UnifiedResponseWrapper<T> {
  const UnifiedResponseWrapper();
}

class SuccessResp<T> extends UnifiedResponseWrapper {
  final T data;
  const SuccessResp(this.data);
}

class FailureResp extends UnifiedResponseWrapper {
  final ApiErrorResponse? errorResponse;
  const FailureResp(this.errorResponse);
}

class ExceptionResp extends UnifiedResponseWrapper {
  final ApiErrorResponse? errorResponse;
  const ExceptionResp(this.errorResponse);
}
