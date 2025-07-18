import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';

abstract class HistoryScreenRepository {
  Future<UnifiedResponseWrapper<dynamic>> getExpenseByPagination(
      int pageNumber);
}
