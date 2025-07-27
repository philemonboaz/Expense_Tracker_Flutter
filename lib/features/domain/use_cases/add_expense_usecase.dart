import 'package:expense_tracker/features/data/repositories/expense_repository_impls/add_expense_repository_impl.dart';

import '../../../core/utils/unified_response_wrapper.dart';

class AddExpenseUseCase {
  AddExpenseUseCase();
  final AddExpenseRepositoryImpl addExpenseRepositoryImpl =
      AddExpenseRepositoryImpl();
  Future<UnifiedResponseWrapper> addExpenseApi(
      {required String amount,
      required String title,
      required String description,
      required String dateOfExpense}) {
    return addExpenseRepositoryImpl.addExpense(
      title: title,
      amount: amount,
      description: description,
      dateOfExpense: dateOfExpense,
    );
  }
}
