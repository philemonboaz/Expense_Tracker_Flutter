import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(0);
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.centerTitle,
      this.toolBarHeight,
      this.actions,
      this.leading});
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final double? toolBarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolBarHeight ?? 0,
      leading: leading,
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
      actions: actions ?? [],
    );
  }
}
