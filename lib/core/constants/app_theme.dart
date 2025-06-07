import 'package:expense_tracker/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    appBarTheme: const AppBarTheme(color: AppColors.primaryLight, elevation: 0),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
      bodySmall: TextStyle(color: AppColors.textLight),
    ),
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.primaryLight,
        onPrimary: AppColors.primaryLiteLight,
        secondary: AppColors.secondaryLight,
        onSecondary: AppColors.secondaryLiteLight,
        error: AppColors.errorLight,
        onError: AppColors.errorLiteLight,
        surface: AppColors.backgroundLight,
        onSurface: AppColors.primaryLight),
    buttonTheme: const ButtonThemeData(
      disabledColor: AppColors.disabledButtonDark,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primaryLight,
          onPrimary: AppColors.primaryLiteLight,
          secondary: AppColors.secondaryLight,
          onSecondary: AppColors.secondaryLiteLight,
          error: AppColors.errorLight,
          onError: AppColors.errorLiteLight,
          surface: AppColors.backgroundLight,
          onSurface: AppColors.primaryLight),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        elevation: 0.5,
        backgroundColor: AppColors.backgroundLight,
        modalElevation: 0.5,
        shadowColor: Colors.black12),
    dividerTheme: const DividerThemeData(color: AppColors.dividerDark),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    appBarTheme: const AppBarTheme(color: AppColors.primaryDark, elevation: 0),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
      bodySmall: TextStyle(color: AppColors.textDark),
    ),
    colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        onPrimary: AppColors.primaryLiteDark,
        secondary: AppColors.secondaryDark,
        onSecondary: AppColors.secondaryLiteDark,
        error: AppColors.errorDark,
        onError: AppColors.errorLiteDark,
        surface: AppColors.backgroundDark,
        onSurface: AppColors.primaryDark),
    buttonTheme: const ButtonThemeData(
      disabledColor: AppColors.disabledButtonDark,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryDark,
          onPrimary: AppColors.primaryLiteDark,
          secondary: AppColors.secondaryDark,
          onSecondary: AppColors.secondaryLiteDark,
          error: AppColors.errorDark,
          onError: AppColors.errorLiteDark,
          surface: AppColors.backgroundDark,
          onSurface: AppColors.primaryDark),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        elevation: 0.5,
        backgroundColor: AppColors.backgroundDark,
        modalElevation: 0.5,
        shadowColor: Colors.white60),
    dividerTheme: const DividerThemeData(color: AppColors.dividerDark),
  );
}
