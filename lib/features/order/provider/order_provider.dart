import 'package:flutter/material.dart';
import 'package:fooder/features/main_bottom_nav/presentation/screens/main_bottom_nav_screen.dart';
import 'package:fooder/features/main_bottom_nav/providers/main_bottom_nav_provider.dart';
import 'package:provider/provider.dart';

class OrderProvider extends ChangeNotifier {
  void onTapOrderConfirmButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainBottomNavScreen(),
      ),
    );
    Provider.of<MainBottomNavProvider>(context, listen: false).backToHome();
  }
}
