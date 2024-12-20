import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeProviders(context);
    });
  }

  Future<void> _initializeProviders(BuildContext context) async {
    await Future.wait([
      Provider.of<FoodProvider>(context, listen: false).loadFood(),
      Provider.of<LocationsProvider>(context, listen: false).loadLocations(),
      Provider.of<CategoriesProvider>(context, listen: false).loadCategories(),
      Provider.of<WishListProvider>(context, listen: false).loadWishList(),
      Provider.of<CartListProvider>(context, listen: false).loadCartList(),
      Provider.of<CheckoutProvider>(context, listen: false).loadCheckoutList(),
    ]);
  }

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
