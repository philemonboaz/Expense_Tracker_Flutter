import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:expense_tracker/features/domain/entities/get_expense_entity.dart';
import 'package:expense_tracker/features/domain/use_cases/home_screen/home_screen_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant_enums.dart';
import '../expense/add_expense/add_expense_screen.dart';

class HomeScreenViewModel extends BaseNotifier {
  List<GetExpenseEntity> getExpenses = [];

  @override
  void initModel() {
    // TODO: implement initModel
    getExpense();
    super.initModel();
  }

  Future<void> getExpense() async {
    try {
      setLoading(true);
      getExpenses = await HomeScreenUseCase().getExpenseApi();
      await Future.delayed(const Duration(seconds: 2));
      setLoading(false);
    } catch (e) {
      apiError = true;
      apiErrorMessage = AppConstants.apiError;
      notifyListeners();
      setLoading(false);
    }
  }

  Future<void> goToAddExpenseScreen(BuildContext ctx) async {
    final Status result = await Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) {
          return const AddExpenseScreen();
        },
      ),
    );
    if (result == Status.success) debugPrint("Success");
    else debugPrint("Failure");
  }
}
