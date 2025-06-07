import '../../data/models/expense_models/get_expense_model.dart';

abstract class HomeScreenRepository {
  Future<List<GetExpenseModel>> getExpense();
}
