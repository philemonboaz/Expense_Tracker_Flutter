import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:expense_tracker/features/domain/entities/get_expense_entity.dart';
import 'package:expense_tracker/features/domain/use_cases/home_screen/home_screen_usecase.dart';

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
}
