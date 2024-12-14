import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> appProviders() {
    return [
      ChangeNotifierProvider(create: (_) => SplashProvider()),
      ChangeNotifierProvider(create: (_) => MainBottomNavProvider()),

      /// Providing LocationRepository to LocationProvider
      ChangeNotifierProvider(
        create: (_) => LocationsProvider(
          LocationRepository(),
        ),
      ),

      /// Providing FoodRepository to FoodProvider
      ChangeNotifierProvider(
        create: (_) => FoodProvider(
          FoodRepository(),
        ),
      ),

      /// Providing FoodProvider to PromoFoodProvider
      ChangeNotifierProxyProvider<FoodProvider, PromoFoodProvider>(
        create: (_) => PromoFoodProvider(
          Provider.of<FoodProvider>(_, listen: false),
        ),
        update: (_, foodProvider, promoFoodProvider) =>
            PromoFoodProvider(foodProvider),
      ),

      /// Providing FoodProvider to CartListProvider
      ChangeNotifierProxyProvider<FoodProvider, CartListProvider>(
        create: (_) => CartListProvider(
          Provider.of<FoodProvider>(_, listen: false),
        ),
        update: (_, foodProvider, cartListProvider) =>
            CartListProvider(foodProvider),
      ),

      /// Providing FoodProvider to WishListProvider
      ChangeNotifierProxyProvider<FoodProvider, WishListProvider>(
        create: (_) => WishListProvider(
          Provider.of<FoodProvider>(_, listen: false),
        ),
        update: (_, foodProvider, wishListProvider) =>
            WishListProvider(foodProvider),
      ),

      /// Providing CartListProvider & FoodProvider to FoodDetailsProvider
      ChangeNotifierProxyProvider2<CartListProvider, FoodProvider,
          FoodDetailsProvider>(
        create: (_) => FoodDetailsProvider(
          Provider.of<CartListProvider>(_, listen: false),
          Provider.of<FoodProvider>(_, listen: false),
        ),
        update: (_, cartListProvider, foodProvider, foodDetailsProvider) =>
            FoodDetailsProvider(cartListProvider, foodProvider),
      ),

      /// Providing CartListProvider & FoodProvider to CheckoutProvider
      ChangeNotifierProxyProvider2<CartListProvider, FoodProvider,
          CheckoutProvider>(
        create: (_) => CheckoutProvider(
          Provider.of<CartListProvider>(_, listen: false),
          Provider.of<FoodProvider>(_, listen: false),
        ),
        update: (_, cartListProvider, foodProvider, checkoutProvider) =>
            CheckoutProvider(cartListProvider, foodProvider),
      ),

      /// Providing FoodProvider to FoodListProvider
      ChangeNotifierProxyProvider<FoodProvider, FoodListProvider>(
        create: (_) => FoodListProvider(
          Provider.of<FoodProvider>(_, listen: false),
        ),
        update: (_, foodProvider, foodListProvider) =>
            FoodListProvider(foodProvider),
      ),

      /// Providing CategoriesRepository to CategoriesProvider
      ChangeNotifierProvider(
        create: (_) => CategoriesProvider(
          CategoryRepository(),
        ),
      ),

      /// Providing CategoriesProvider, PromoFoodProvider & LocationsProvider to HomeProvider
      ChangeNotifierProxyProvider3<CategoriesProvider, PromoFoodProvider,
          LocationsProvider, HomeProvider>(
        create: (_) => HomeProvider(
          Provider.of<CategoriesProvider>(_, listen: false),
          Provider.of<PromoFoodProvider>(_, listen: false),
          Provider.of<LocationsProvider>(_, listen: false),
        ),
        update: (_, categoriesProvider, promoFoodProvider, locationsProvider,
                homeProvider) =>
            HomeProvider(
                categoriesProvider, promoFoodProvider, locationsProvider),
      ),
    ];
  }
}
