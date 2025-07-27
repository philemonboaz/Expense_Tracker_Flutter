import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight ?? kToolbarHeight);
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.centerTitle,
      required this.backgroundColor,
      required this.titleStyle,
      this.foregroundColor,
      this.toolBarHeight,
      this.actions,
      this.leading});
  final String title;
  final bool centerTitle;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final double? toolBarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolBarHeight ?? 0,
      backgroundColor: backgroundColor,
      leading: leading,
      foregroundColor: foregroundColor ?? Colors.black,
      centerTitle: centerTitle,
      titleTextStyle: titleStyle,
      title: Text(
        title,
        // style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
      actions: actions ?? [],
    );
  }
}
