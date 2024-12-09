import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/features/cart/presentation/screens/cart_screen.dart';
import 'package:fooder/features/category/presentation/screens/category_screen.dart';
import 'package:fooder/features/home/presentations/screens/home_screen.dart';
import 'package:fooder/features/wish_list/presentation/screens/wish_list_screen.dart';

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
}
