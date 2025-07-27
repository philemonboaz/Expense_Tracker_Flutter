import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/domain/entities/get_expense_entity.dart';
import 'package:expense_tracker/features/domain/use_cases/home_screen/home_screen_usecase.dart';
import 'package:expense_tracker/features/presentation/pages/expense/add_expense/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/constant_enums.dart';
import '../../../../core/utils/common_widgets.dart';

class HomeScreenViewModel extends BaseNotifier {
  List<GetExpenseEntity> getExpenses = [];

  @override
  void initModel() {
    // TODO: implement initModel
    getExpense(
        (DateFormat("yyyy-MM-dd", DateTime.now().toString())).toString());
    super.initModel();
  }

  Future<void> getExpense(String date) async {
    try {
      setLoading(true);
      UnifiedResponseWrapper apiResponse =
          await HomeScreenUseCase().getExpenseApi(date: "2025-07-27");
      if (apiResponse is SuccessResp) {
        getExpenses = apiResponse.data;
      } else if (apiResponse is FailureResp) {
        apiError = true;
        apiErrorMessage = apiResponse.errorResponse!.errorMessage;
      }
      setLoading(false);
      notifyListeners();
    } catch (e) {
      apiError = true;
      apiErrorMessage = AppConstants.apiError;
      notifyListeners();
      setLoading(false);
    }
  }

  Future<void> goToAddExpenseScreen(BuildContext ctx) async {
    final result = await showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return const AddExpenseScreen();
      },
    );

    if (result == Status.success) {
      if (ctx.mounted) {
        customSnackBar(
          ctx: ctx,
          backgroundColor: Theme.of(ctx).primaryColorDark,
          snackBarContent: "Expense added successfully!",
          textStyle: TextStyle(fontSize: 14, color: Theme.of(ctx).primaryColor),
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      }
    } else if (result == Status.error) {
      debugPrint("Failure");
      if (ctx.mounted) {
        customSnackBar(
          ctx: ctx,
          backgroundColor: Theme.of(ctx).primaryColorDark,
          snackBarContent: "Failed to add!",
        );
      }
    } else if (result == Status.exception) {
      if (ctx.mounted) {
        debugPrint("Not Added");
        customSnackBar(
          ctx: ctx,
          backgroundColor: Theme.of(ctx).indicatorColor,
          snackBarContent: "Failed to add!",
        );
      }
    }
  }

  void getRecordsByMonthsForScreens(String date) {
    getExpense(date);
  }
}
