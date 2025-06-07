class TokenModel {
  String token;

  TokenModel({required this.token});

  factory TokenModel.fromJson(String data) {
    return TokenModel(token: data);
  }

  @override
  String toString() {
    return token;
  }
}
