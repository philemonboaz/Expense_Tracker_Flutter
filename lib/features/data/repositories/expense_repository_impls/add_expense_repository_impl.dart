import '../../../../core/constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/api_response_model.dart';
import '../../../domain/repositories/expense_repository.dart';
import '../../models/expense_models/add_expense_model.dart';

class AddExpenseRepositoryImpl implements ExpenseRepository {
  final ApiClient apiClient = ApiClient();
  @override
  Future<AddExpenseModel> addExpense(String title, String? subTitle,
      String? description, double amount) async {
    BaseApiResponse response = await apiClient.post(
      Urls.addExpenseUrl,
      body: {
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "amount": amount
      },
    );

    AddExpenseModel addExpenseResponse =
        AddExpenseModel.setApiData(response.data);

    return addExpenseResponse;
  }
}
