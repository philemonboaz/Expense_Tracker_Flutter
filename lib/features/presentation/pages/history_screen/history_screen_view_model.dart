import 'package:expense_tracker/core/provider/base_notifier.dart';
import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/data/models/expense_models/get_expense_model_from_db.dart';
import 'package:expense_tracker/features/domain/use_cases/history_screen/history_screen_usecase.dart';

class HistoryScreenViewModel extends BaseNotifier {
  final HistoryScreenUsecase historyScreenUsecase = HistoryScreenUsecase();
  List<GetExpenseModelFromDb> historyData = [];

  late int _pageNumber;
  @override
  void initModel() {
    // TODO: implement initModel
    super.initModel();
    _pageNumber = 1;
    setLoading(true);
    getExpenseData(_pageNumber);
  }

  Future<void> getExpenseData(int pageNumber) async {
    UnifiedResponseWrapper apiResponse =
        await historyScreenUsecase.getHistoryExpenseByPagination(pageNumber);
    if (apiResponse is SuccessResp) {
      historyData = apiResponse.data;
    } else if (apiResponse is FailureResp) {
      apiErrorMessage = apiResponse.errorResponse?.errorMessage;
    }

    setLoading(false);
  }
}
