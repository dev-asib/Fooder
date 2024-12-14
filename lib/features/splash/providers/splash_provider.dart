import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> moveToBottomNavScreen(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (context.mounted) {
          Navigator.pushNamed(
            context,
            RouteNames.mainBottomNavScreen,
          );
        }
      },
    );
  }
}
