import 'package:expense_tracker/core/network/api_client.dart';
import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/data/models/expense_models/get_expense_model_from_db.dart';
import 'package:expense_tracker/features/domain/repositories/history_screen_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/urls.dart';
import '../../../../core/utils/api_response_model.dart';
import '../../../../core/utils/global.dart';

class HistoryScreenRepositoryImpl extends HistoryScreenRepository {
  final ApiClient apiClient = ApiClient();
  @override
  Future<UnifiedResponseWrapper> getExpenseByPagination(int pageNumber) async {
    // TODO: implement getExpense
    BaseApiResponse response = await apiClient.post(Urls.historyByPagination,
        body: {
          "deviceId": Global.deviceId.toString(),
          "pageNumber": pageNumber
        });
    debugPrint("Result of Get Expense : $response");
    if (response.error == null) {
      if (response.data is List) {
        // for a list of data coming in the data as multiple json objects inside a list
        return SuccessResp(List<GetExpenseModelFromDb>.from(
            response.data.map((e) => GetExpenseModelFromDb.fromJson(e))));
      } else if (response.data is Map<String, dynamic>) {
        // For a single response coming in data as single json object
        return SuccessResp([GetExpenseModelFromDb.fromJson(response.data)]);
      } else {
        return SuccessResp([GetExpenseModelFromDb.fromJson(response.data)]);
      }
    } else {
      return FailureResp(response.error);
    }
  }
}
