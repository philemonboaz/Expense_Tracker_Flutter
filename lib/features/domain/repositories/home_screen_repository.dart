import 'package:expense_tracker/core/utils/unified_response_wrapper.dart';

import '../../data/models/expense_models/get_expense_model.dart';

abstract class HomeScreenRepository {
  Future<UnifiedResponseWrapper> getExpense({required String date});
}
