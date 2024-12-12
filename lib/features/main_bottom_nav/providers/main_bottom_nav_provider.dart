import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class MainBottomNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  int get selectedIndex => _selectedIndex;

  List<Widget> get screens => _screens;

  void onChangedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Color iconSectionColor(int index) {
    return _selectedIndex == index
        ? AppColors.kPrimaryColor
        : AppColors.kGreyColor;
  }

  void backToHome() {
    onChangedIndex(0);
    notifyListeners();
  }

  void backToCategory() {
    onChangedIndex(1);
    notifyListeners();
  }
}
