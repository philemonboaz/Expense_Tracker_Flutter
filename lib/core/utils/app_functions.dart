import 'package:flutter/material.dart';

class AppFunctions {
  static PreferredSizeWidget customAppBar({
    required BuildContext context,
    String? headerTitle,
    Color? titleColor,
    bool isBackPress = true,
    bool centerTitle = false,
    bool isActionsEnabled = false,
    List<Widget>? listOfActions,
    double? toolBarHeight,
    Color? backgroundColor,
    Function()? onBackPressed,
  }) {
    return AppBar(
      centerTitle: centerTitle,
      title: headerTitle != null
          ? Text(
              headerTitle,
              style: TextStyle(color: titleColor ?? Colors.black),
            )
          : null,
      toolbarTextStyle: TextStyle(color: titleColor ?? Colors.black),
      actions: isActionsEnabled ? listOfActions : null,
      toolbarHeight: toolBarHeight ?? 50,
      backgroundColor: backgroundColor ?? Colors.white12,
      leading: isBackPress
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: titleColor ?? Colors.black,
              ),
              iconSize: 30,
            )
          : null,
    );
  }
}
