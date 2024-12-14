import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.mainBottomNavScreen:
        return _buildRoute(const MainBottomNavScreen(), settings);
      case RouteNames.homeScreen:
        return _buildRoute(const HomeScreen(), settings);
      case RouteNames.categoryScreen:
        return _buildRoute(const CategoryScreen(), settings);
      case RouteNames.cartListScreen:
        return _buildRoute(const CartScreen(), settings);
      case RouteNames.wishListScreen:
        return _buildRoute(const WishListScreen(), settings);
      case RouteNames.checkoutScreen:
        return _buildRoute(const CheckoutScreen(), settings);
      case RouteNames.orderScreen:
        return _buildRoute(const OrderScreen(), settings);
      case RouteNames.foodListScreen:
        return _buildRoute(const FoodListScreen(), settings);
      case RouteNames.foodDetailsScreen:
        return _buildRoute(const FoodDetailsScreen(), settings);
      default:
        return _buildRoute(const UnknownScreen(), settings);
    }
  }

  static MaterialPageRoute _buildRoute(
    Widget screen,
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) => screen,
      settings: settings,
    );
  }
}
