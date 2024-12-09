import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actionWidgets,
    this.leadingWidget,
  });

  final String title;
  final List<Widget>? actionWidgets;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 72,
      leading: leadingWidget,
      title: Text(title),
      centerTitle: true,
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
