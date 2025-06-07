import 'package:expense_tracker/core/utils/api_response_model.dart';
import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/data/models/authentication/token_model.dart';
import 'package:expense_tracker/features/domain/repositories/authentication_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/urls.dart';
import '../../../../core/network/api_client.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final ApiClient apiClient = ApiClient();
  @override
  Future<Result<TokenModel>> getJwtToken(String deviceId) async {
    try {
      BaseApiResponse response =
          await apiClient.post(Urls.jwtTokenUrl, body: {"deviceId": deviceId});

      if (response.error == null && response.data is String) {
        return SuccessResp(TokenModel.fromJson(response.data));
      } else {
        return FailureResp(response.error!.errorMessage);
      }
    } catch (e) {
      debugPrint("Error occ $e");
      return FailureResp(e.toString());
    }
  }
}
