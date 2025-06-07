import 'package:expense_tracker/core/utils/media_query_manager.dart';
import 'package:expense_tracker/features/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_theme.dart';
import 'features/presentation/pages/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  runApp(const ExpenseTrackerMain());
}

class ExpenseTrackerMain extends StatelessWidget {
  const ExpenseTrackerMain({super.key});
  static bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        // showPerformanceOverlay: true,
        title: "Expense Tracker",
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, // Automatically switches based on system
        builder: (context, child) {
          MediaQueryManager.init(context);
          return child!;
        },
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
