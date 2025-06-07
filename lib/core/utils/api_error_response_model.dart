class ApiErrorResponse {
  final int errorCode;
  final String errorMessage;
  final String? errorDescription;

  const ApiErrorResponse(
      {required this.errorCode,
      required this.errorMessage,
      this.errorDescription});

  factory ApiErrorResponse.fromJson(Map<String,dynamic> json){
    return ApiErrorResponse(errorCode: json['errorCode'], errorMessage: json['errorMessage'],errorDescription: json['errorDescription']);
  }
}
