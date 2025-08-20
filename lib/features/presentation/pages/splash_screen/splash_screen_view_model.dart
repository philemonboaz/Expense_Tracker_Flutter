import 'package:expense_tracker/core/provider/base_notifier.dart';

import '../../../domain/use_cases/authentication/get_token_usecase.dart';

class SplashScreenViewModel extends BaseNotifier {
  final GetTokenUsecase getTokenUsecase = GetTokenUsecase();
}
