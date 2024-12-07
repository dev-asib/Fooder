import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:gap/gap.dart';

class HorizontalIconIconWithText extends StatelessWidget {
  const HorizontalIconIconWithText({
    super.key,
    required this.title,
    required this.icon,
    this.iconBgColor,
    this.iconColor,
  });

  final String title;
  final IconData icon;
  final Color? iconBgColor;
  final Color? iconColor;

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
            size: 20,
            color: iconColor ?? AppColors.kAmberYellowColor,
          ),
        ),
        const Gap(8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
