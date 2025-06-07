import 'package:expense_tracker/features/data/models/expense_models/add_expense_model.dart';
import 'package:expense_tracker/features/data/repositories/expense_repository_impls/add_expense_repository_impl.dart';

class AddExpenseUseCase {
  final AddExpenseRepositoryImpl addExpenseRepositoryImpl;
  AddExpenseUseCase(this.addExpenseRepositoryImpl);
  Future<AddExpenseModel> addExpenseApi(
      double amount, String title, String? subTitle, String? description) {
    return addExpenseRepositoryImpl.addExpense(
        title, subTitle, description, amount);
  }
}
