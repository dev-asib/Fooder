import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.bgColor,
    this.fgColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
