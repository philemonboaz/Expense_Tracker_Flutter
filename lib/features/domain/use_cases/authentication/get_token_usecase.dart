import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/data/repositories/authentication/authentication_repository_impl.dart';

class GetTokenUsecase {
  final AuthenticationRepositoryImpl authenticationRepositoryImpl =
      AuthenticationRepositoryImpl();

  Future<UnifiedResponseWrapper> getJwtToken(String deviceId) async {
    return await authenticationRepositoryImpl.getJwtToken(deviceId);
  }
}
