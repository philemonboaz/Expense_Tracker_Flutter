import 'package:expense_tracker/core/constants/urls.dart';
import 'package:expense_tracker/core/network/api_client.dart';
import 'package:expense_tracker/core/utils/api_response_model.dart';
import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/domain/repositories/home_screen_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/exception_model.dart';
import '../../../../core/utils/global.dart';
import '../../models/expense_models/get_expense_model.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  final ApiClient apiClient = ApiClient();
  @override
  Future<UnifiedResponseWrapper> getExpense({required String date}) async {
    try {
      BaseApiResponse response = await apiClient.post(
        Urls.getExpenseUrl,
        body: {
          "deviceId": Global.deviceId,
          "monthAndYear": date,
        },
      );
      debugPrint("Result of Get Expense : $response");
      if (response.error == null) {
        if (response.data is List) {
          // for a list of data coming in the data as multiple json objects inside a list
          return SuccessResp(List<GetExpenseModel>.from(
              response.data.map((e) => GetExpenseModel.fromJson(e))));
        } else if (response.data is Map<String, dynamic>) {
          // For a single response coming in data as single json object
          return SuccessResp(GetExpenseModel.fromJson(response.data));
        } else {
          return const SuccessResp([]);
        }
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
