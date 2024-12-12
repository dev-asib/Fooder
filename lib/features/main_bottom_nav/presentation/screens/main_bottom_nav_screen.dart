import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';

class MainBottomNavScreen extends StatelessWidget {
  const MainBottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainBottomNavProvider = Provider.of<MainBottomNavProvider>(context);
    return Scaffold(
      body: mainBottomNavProvider.screens[mainBottomNavProvider.selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        mainBottomNavProvider: mainBottomNavProvider,
      ),
    );
  }
}
