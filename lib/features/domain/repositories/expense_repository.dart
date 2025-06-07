import '../../data/models/expense_models/add_expense_model.dart';

abstract class ExpenseRepository {
  Future<AddExpenseModel> addExpense(
      String title, String? subTitle, String? description, double amount);
}
