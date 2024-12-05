import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.bgColor,
    this.fgColor,
    this.radius = 100,
    this.leftPadding = 0,
    this.rightPadding,
    this.paddingAll,
    this.horizontalPadding,
    this.verticalPadding,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double? leftPadding;
  final double? rightPadding;
  final double? paddingAll;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? bgColor;
  final Color? fgColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
        ),
        backgroundColor: bgColor,
        foregroundColor: fgColor,
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      padding: EdgeInsets.only(left: leftPadding!),
    );
  }
}
