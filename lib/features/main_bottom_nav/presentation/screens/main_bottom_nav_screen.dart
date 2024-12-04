import 'package:flutter/material.dart';
import 'package:fooder/core/widgets/custom_bottom_nav_bar.dart';
import 'package:fooder/features/main_bottom_nav/providers/main_bottom_nav_provider.dart';
import 'package:provider/provider.dart';

class MainBottomNavScreen extends StatelessWidget {
  const MainBottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainBottomNavProvider = Provider.of<MainBottomNavProvider>(context);
    return Scaffold(
      body: mainBottomNavProvider.screens[mainBottomNavProvider.selectedIndex],
      bottomNavigationBar:
          CustomBottomNavBar(mainBottomNavProvider: mainBottomNavProvider),
    );
  }
}
