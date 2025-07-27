import '../../../../core/constants/urls.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/api_response_model.dart';
import '../../../../core/utils/global.dart';
import '../../../../core/utils/unified_response_wrapper.dart';
import '../../../domain/repositories/expense_repository.dart';

class AddExpenseRepositoryImpl implements ExpenseRepository {
  final ApiClient apiClient = ApiClient();
  @override
  Future<UnifiedResponseWrapper> addExpense(
      {required String title,
      required String dateOfExpense,
      required String description,
      required String amount}) async {
    BaseApiResponse response = await apiClient.post(
      Urls.addExpenseUrl,
      body: {
        "deviceId": Global.deviceId,
        "title": title,
        "dateOfExpense": dateOfExpense,
        "description": description,
        "amount": amount
      },
    );
    if (response.error == null &&
        response.message.toUpperCase() == "OK" &&
        response.statusCode == 200) {
      return SuccessResp(response.message);
    } else if (response.error != null) {
      return FailureResp(response.error);
    } else {
      return FailureResp(response.error);
    }
  }
}
