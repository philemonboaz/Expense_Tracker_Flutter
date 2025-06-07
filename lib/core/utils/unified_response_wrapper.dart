abstract class Result<T> {
  const Result();
}

class SuccessResp<T> extends Result<T> {
  final T data;
  const SuccessResp(this.data);
}

class FailureResp<T> extends Result<T> {
  final String errMsg;
  const FailureResp(this.errMsg);
}
