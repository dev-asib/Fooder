import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class AlertMessage {
  static void showFlushBarMessage({
    required BuildContext context,
    required String message,
  }) async {
    final TextTheme textTheme = Theme.of(context).textTheme;
    Flushbar(
      messageText: Text(
        textAlign: TextAlign.center,
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
