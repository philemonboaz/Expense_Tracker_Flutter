import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';
import 'package:expense_tracker/features/data/repositories/expense_repository_impls/history_screen_repository_impl.dart';

class HistoryScreenUsecase {
  final HistoryScreenRepositoryImpl historyScreenRepositoryImpl =
      HistoryScreenRepositoryImpl();
  Future<UnifiedResponseWrapper> getHistoryExpenseByPagination(
      int pageNumber) async {
    return historyScreenRepositoryImpl.getExpenseByPagination(pageNumber);
  }
}
