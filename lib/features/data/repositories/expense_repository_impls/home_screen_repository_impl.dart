import 'package:expense_tracker/core/constants/urls.dart';
import 'package:expense_tracker/core/network/api_client.dart';
import 'package:expense_tracker/core/utils/api_response_model.dart';
import 'package:expense_tracker/features/domain/repositories/home_screen_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../models/expense_models/get_expense_model.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  final ApiClient apiClient = ApiClient();

  @override
  Future<List<GetExpenseModel>> getExpense() async {
    BaseApiResponse response = await apiClient.get(Urls.getExpenseUrl);
    debugPrint("Result of Get Expense : $response");
    if (response.error == null) {
      if (response.data is List) {
        // for a list of data coming in the data as multiple json objects inside a list
        return List<GetExpenseModel>.from(
            response.data.map((e) => GetExpenseModel.fromJson(e)));
      } else if (response.data is Map<String, dynamic>) {
        // For a single response coming in data as single json object
        return [GetExpenseModel.fromJson(response.data)];
      }
    } else {
      throw Exception(response.error);
    }
    return [];
  }
}
