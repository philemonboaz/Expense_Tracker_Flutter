import 'package:expense_tracker/features/presentation/pages/splash_screen/splash_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../pages/home_screen/home_screen_view_model.dart';

List<ChangeNotifierProvider> appProviders = [
  ChangeNotifierProvider<HomeScreenViewModel>(
      create: (_) => HomeScreenViewModel()),
  ChangeNotifierProvider<SplashScreenViewModel>(create: (_) => SplashScreenViewModel())
];
