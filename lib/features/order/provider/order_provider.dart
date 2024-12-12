import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
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
