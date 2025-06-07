import 'package:expense_tracker/features/data/models/authentication/token_model.dart';

import '../../../core/utils/unified_response_wrapper.dart';

abstract class AuthenticationRepository {
  Future<Result<TokenModel>> getJwtToken(String deviceId);
}
