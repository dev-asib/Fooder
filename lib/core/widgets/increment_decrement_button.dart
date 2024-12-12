import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class IncrementDecrementButton extends StatelessWidget {
  const IncrementDecrementButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.bgColor = AppColors.kPrimaryColor,
    this.fgColor = AppColors.kWhiteColor,
    this.radius = 4,
  });

  final IconData icon;
  final Color bgColor;
  final Color fgColor;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        foregroundColor: fgColor,
        backgroundColor: bgColor,
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
