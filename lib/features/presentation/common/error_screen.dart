import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/core/utils/app_functions.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorMessage;
  final String? errorScreenTitle;
  const ErrorScreen(
      {super.key, required this.errorMessage, required this.errorScreenTitle});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = const MediaQueryData();
    return Scaffold(
      appBar: AppFunctions.customAppBar(
          context: context,
          isBackPress: true,
          headerTitle: errorScreenTitle ?? AppConstants.error),
      body: Container(
        height: mediaQueryData.size.height,
        width: mediaQueryData.size.height,
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: Text(
            errorMessage ?? AppConstants.error400,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
