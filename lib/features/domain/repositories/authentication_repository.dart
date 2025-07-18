import '../../../core/utils/unified_response_wrapper.dart';

abstract class AuthenticationRepository {
  Future<UnifiedResponseWrapper> getJwtToken(String deviceId);
}
