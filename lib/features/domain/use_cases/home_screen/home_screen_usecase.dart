import 'package:expense_tracker/features/data/models/expense_models/get_expense_model.dart';
import 'package:expense_tracker/features/data/repositories/expense_repository_impls/home_screen_repository_impl.dart';
import 'package:expense_tracker/features/domain/entities/get_expense_entity.dart';

class HomeScreenUseCase {
  Future<List<GetExpenseEntity>> getExpenseApi() async {
    List<GetExpenseEntity> result = [];
    List<GetExpenseModel> response =
        await HomeScreenRepositoryImpl().getExpense();

    for (var element in response) {
      result.add(
        GetExpenseEntity(
            id: element.id,
            title: element.title,
            createdAt: element.createdAt,
            amount: element.amount,
            description: element.description),
      );
    }

    return result;
  }
}
