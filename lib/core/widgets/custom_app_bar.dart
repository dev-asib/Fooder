import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actionWidgets,
  });

  final String title;
  final List<Widget>? actionWidgets;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Text(
        title,
        style: textTheme.titleLarge,
      ),
      centerTitle: true,
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
