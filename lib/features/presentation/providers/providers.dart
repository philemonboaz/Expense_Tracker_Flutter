import 'package:expense_tracker/features/presentation/pages/expense/add_expense/add_expense_view_model.dart';
import 'package:expense_tracker/features/presentation/pages/history_screen/history_screen_view_model.dart';
import 'package:expense_tracker/features/presentation/pages/splash_screen/splash_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../pages/home_screen/home_screen_view_model.dart';

List<ChangeNotifierProvider> appProviders = [
  ChangeNotifierProvider<HomeScreenViewModel>(
      create: (_) => HomeScreenViewModel()),
  ChangeNotifierProvider<SplashScreenViewModel>(
      create: (_) => SplashScreenViewModel()),
  ChangeNotifierProvider<HistoryScreenViewModel>(
      create: (_) => HistoryScreenViewModel()),
  ChangeNotifierProvider<AddExpenseViewModel>(
      create: (_) => AddExpenseViewModel()),
];
