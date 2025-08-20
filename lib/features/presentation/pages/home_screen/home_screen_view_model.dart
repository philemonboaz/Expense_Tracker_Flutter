import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/domain/entities/get_expense_entity.dart';
import 'package:expense_tracker/features/domain/use_cases/home_screen/home_screen_usecase.dart';
import 'package:expense_tracker/features/presentation/pages/expense/add_expense/add_expense_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant_enums.dart';
import '../../../../core/utils/common_widgets.dart';

class HomeScreenViewModel extends BaseNotifier {
  List<GetExpenseEntity> getExpenses = [];
  late String _initialDate;
  late DateTime _todayDate;
  @override
  void initModel() {
    // TODO: implement initModel
    super.initModel();
    // getExpense("2025-07-27");
    _todayDate = DateTime.now();
    _initialDate =
        "${_todayDate.year}-${_dateFormatting(_todayDate.month.toString())}-${_dateFormatting(_todayDate.day.toString())}";
    getExpense(_initialDate);
  }

  String _dateFormatting(String num) {
    if (num.length == 1) {
      return "0$num";
    } else {
      return num;
    }
  }

  Future<void> getExpense(String date) async {
    try {
      setLoading(true);
      UnifiedResponseWrapper apiResponse =
          await HomeScreenUseCase().getExpenseApi(date);
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
        await getExpense(_initialDate);
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
    if (date.isNotEmpty) {
      getExpense(date);
    } else {
      return;
    }
  }
}
