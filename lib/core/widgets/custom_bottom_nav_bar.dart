import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/features/main_bottom_nav/providers/main_bottom_nav_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.mainBottomNavProvider,
  });

  final MainBottomNavProvider mainBottomNavProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: AppColors.kWhiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavIconSection(
            icon: Icons.home_outlined,
            index: 0,
          ),
          _buildBottomNavIconSection(
            icon: Icons.category,
            index: 1,
          ),
          _buildBottomNavIconSection(
            icon: Icons.shopping_cart_outlined,
            index: 2,
          ),
          _buildBottomNavIconSection(
            icon: Icons.favorite_outline,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavIconSection({
    required IconData icon,
    required int index,
  }) {
    return InkWell(
      onTap: () => mainBottomNavProvider.onChangedIndex(index),
      child: Icon(
        icon,
        color: mainBottomNavProvider.iconSectionColor(index),
        size: 35,
      ),
    );
  }
}
