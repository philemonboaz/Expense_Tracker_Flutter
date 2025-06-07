import 'package:expense_tracker/features/presentation/common/state_view_model.dart';
import 'package:expense_tracker/features/presentation/pages/home_screen/home_screen.dart';
import 'package:expense_tracker/features/presentation/pages/splash_screen/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState
    extends StateViewModel<SplashScreen, SplashScreenViewModel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   initialize the app needs.
    return uiUpdate(
      builder: (model) => model.isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                        maxHeight: 300,
                        maxWidth: 300,
                        minHeight: 250,
                        minWidth: 250),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AppAssets.logo),
                  ),
                  SvgPicture.asset(AppAssets.logo),
                  const CircularProgressIndicator(),
                ],
              ),
            )
          : const Scaffold(
              body: HomeScreen(),
            ),
    );
  }
}
