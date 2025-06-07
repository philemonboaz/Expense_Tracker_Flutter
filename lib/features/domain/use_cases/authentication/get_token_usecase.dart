import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/data/models/authentication/token_model.dart';
import 'package:expense_tracker/features/data/repositories/authentication/authentication_repository_impl.dart';

class GetTokenUsecase {
  final AuthenticationRepositoryImpl authenticationRepositoryImpl =
      AuthenticationRepositoryImpl();

  Future<Result<TokenModel>> getJwtToken(String deviceId) {
    return authenticationRepositoryImpl.getJwtToken(deviceId);
  }
}
