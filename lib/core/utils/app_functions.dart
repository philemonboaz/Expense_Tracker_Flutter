import 'package:flutter/material.dart';

class AppFunctions {
  static PreferredSizeWidget customAppBar({
    required BuildContext context,
    String? headerTitle,
    bool isBackPress = true,
    bool centerTitle = false,
    bool isActionsEnabled = false,
    List<Widget>? listOfActions,
    double? toolBarHeight,
    Function()? onBackPressed,
  }) {
    return AppBar(
      centerTitle: centerTitle,
      title: headerTitle != null ? Text(headerTitle) : null,
      actions: isActionsEnabled ? listOfActions : null,
      toolbarHeight: toolBarHeight ?? 50,
      leading: isBackPress
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
            )
          : null,
    );
  }
}
