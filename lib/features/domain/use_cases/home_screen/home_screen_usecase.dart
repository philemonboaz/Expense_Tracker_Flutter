import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/data/models/expense_models/get_expense_model.dart';
import 'package:expense_tracker/features/data/repositories/expense_repository_impls/home_screen_repository_impl.dart';
import 'package:expense_tracker/features/domain/entities/get_expense_entity.dart';

import '../../../../core/utils/common_helper_functions.dart';

class HomeScreenUseCase {
  Future<UnifiedResponseWrapper> getExpenseApi({required String date}) async {
    List<GetExpenseEntity> result = [];
    UnifiedResponseWrapper response =
        await HomeScreenRepositoryImpl().getExpense(date: date);

    if (response is SuccessResp) {
      for (GetExpenseModel element in response.data) {
        result.add(
          GetExpenseEntity(
              id: element.id,
              title: element.title,
              createdAt: dateFormat(element.createdAt),
              amount: element.amount,
              description: element.description),
        );
      }
      return SuccessResp(result);
    } else {
      return response;
    }
  }
}
