import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';

abstract class ExpenseRepository {
  Future<UnifiedResponseWrapper> addExpense(
      {required String title,
      required String dateOfExpense,
      required String description,
      required String amount});
}
