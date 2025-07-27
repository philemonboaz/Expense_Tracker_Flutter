import 'package:expense_tracker/core/constants/constant_enums.dart';
import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/domain/use_cases/add_expense_usecase.dart';
import 'package:flutter/material.dart';

class AddExpenseViewModel extends BaseNotifier {
  AddExpenseViewModel();
  final AddExpenseUseCase addExpenseUseCase = AddExpenseUseCase();

  @override
  initModel() {
    super.initModel();
    setLoading(false);
  }

  Future<void> addExpense(
      {required BuildContext ctx,
      required String amount,
      required String title,
      required String dateOfExpense,
      required String description}) async {
    try {
      setLoading(true); // ✅ This will access _isLoading from BaseNotifier
      UnifiedResponseWrapper apiResponse =
          await addExpenseUseCase.addExpenseApi(
              amount: amount,
              title: title,
              description: description,
              dateOfExpense: dateOfExpense);
      // await Future.delayed(const Duration(seconds: 2));
      if (apiResponse is SuccessResp) {
        Navigator.pop(ctx, Status.success);
        debugPrint("Successfully updated in the table");
      } else {
        debugPrint("Failure on update to the table");
        Navigator.pop(ctx, Status.error);
      }
      setLoading(false);
    } catch (e) {
      setLoading(false);
      Navigator.pop(ctx, Status.exception);
      debugPrint("Error: $e");
    }
  }

  @override
  notifyListeners();
}
