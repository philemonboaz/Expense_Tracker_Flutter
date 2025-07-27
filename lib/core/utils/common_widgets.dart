import 'package:flutter/material.dart';

Widget bottomSheetHeader(
    {required BuildContext ctx,
    required String headerTitle,
    required bool closeButtonNeeded,
    Color? backgroundColor,
    Color? headerColor,
    TextStyle? customTextStyle,
    double? customFontSize,
    Color? closeButtonColor}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: Theme.of(ctx).colorScheme.inversePrimary,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    constraints: const BoxConstraints(minHeight: 50, maxHeight: 80),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerTitle,
            style: customTextStyle ??
                TextStyle(
                    color: Theme.of(ctx).primaryColorDark,
                    fontSize: customFontSize ?? 20),
          ),
          if (closeButtonNeeded)
            GestureDetector(
              onTap: () {
                Navigator.pop(ctx);
              },
              child: Icon(
                Icons.close,
                size: 40,
                color: closeButtonColor ?? Theme.of(ctx).primaryColorDark,
              ),
            ),
        ],
      ),
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar({
  required BuildContext ctx,
  required String snackBarContent,
  required Color backgroundColor,
  bool? showCloseIcon,
  Duration? timeOfShowInSeconds,
  Icon? leadingIcon,
  TextStyle? textStyle,
  ShapeBorder? shapeBorder,
  EdgeInsets? margin,
}) {
  return ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      duration: timeOfShowInSeconds ?? const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          if (leadingIcon != null) leadingIcon,
          Text(
            snackBarContent,
            style: textStyle ??
                TextStyle(fontSize: 20, color: Theme.of(ctx).primaryColorLight),
          ),
        ],
      ),
      shape: shapeBorder ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.all(8),
    ),
  );
}
