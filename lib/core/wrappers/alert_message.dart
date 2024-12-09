import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';

class AlertMessage {
  static void showFlushBarMessage({
    required BuildContext context,
    required String message,
  }) async {
    final TextTheme textTheme = Theme.of(context).textTheme;
    Flushbar(
      messageText: Text(
        message,
        style: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.kWhiteColor,
        ),
      ),
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      margin: const EdgeInsets.all(8),

      borderRadius: BorderRadius.circular(8),
      backgroundColor: AppColors.kPrimaryColor,
    ).show(context);
  }
}
