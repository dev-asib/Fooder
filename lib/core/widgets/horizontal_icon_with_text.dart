import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';

class HorizontalIconIconWithText extends StatelessWidget {
  const HorizontalIconIconWithText({
    super.key,
    required this.title,
    required this.icon,
    this.iconBgColor,
    this.iconColor,
    this.fontSize,
    this.middleGap = 8,
    this.iconSize = 20,
  });

  final String title;
  final IconData icon;
  final Color? iconBgColor;
  final Color? iconColor;
  final double middleGap;
  final double iconSize;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: iconBgColor ?? Colors.transparent,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2),
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor ?? AppColors.kAmberYellowColor,
          ),
        ),
        Gap(middleGap),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
