import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actionWidgets,
    this.fontFamily,
    this.fontColor,
  });

  final String title;
  final List<Widget>? actionWidgets;
  final String? fontFamily;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Text(
        title,
        style: textTheme.titleLarge?.copyWith(
          fontFamily: fontFamily,
          color: fontColor,
        ),
      ),
      centerTitle: true,
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
