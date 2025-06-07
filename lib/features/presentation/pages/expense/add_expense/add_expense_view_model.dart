import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:expense_tracker/features/domain/use_cases/add_expense_usecase.dart';
import 'package:flutter/cupertino.dart';

class AddExpenseProvider extends BaseNotifier {
  final AddExpenseUseCase addExpenseUseCase;

  AddExpenseProvider(this.addExpenseUseCase);

  Future<void> addExpense(double amount, String title, String? subTitle,
      String? description) async {
    try {
      setLoading(true); // ✅ This will access _isLoading from BaseNotifier
      await addExpenseUseCase.addExpenseApi(
          amount, title, subTitle, description);
      await Future.delayed(const Duration(seconds: 2));
      setLoading(false);
    } catch (e) {
      setLoading(false);
      debugPrint("Error: $e");
    }
  }

  @override
  notifyListeners();
}
