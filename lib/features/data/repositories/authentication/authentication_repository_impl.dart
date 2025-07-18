import 'package:expense_tracker/core/utils/api_response_model.dart';
import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/data/models/authentication/token_model.dart';
import 'package:expense_tracker/features/domain/repositories/authentication_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/exception_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final ApiClient apiClient = ApiClient();
  @override
  Future<UnifiedResponseWrapper> getJwtToken(String deviceId) async {
    try {
      BaseApiResponse response = await apiClient
          .tokenGenPost(Urls.jwtTokenUrl, body: {"deviceId": deviceId});

      if (response.error == null && response.data is String) {
        return SuccessResp(TokenModel.fromJson(response.data));
      } else {
        return FailureResp(response.error);
      }
    } catch (e) {
      debugPrint("Error occ $e");
      return ExceptionResp(getExceptionErrorResp(
          e is Exception ? e : Exception("Unknown Error")));
    }
  }
}
