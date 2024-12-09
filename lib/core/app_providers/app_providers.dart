import 'package:fooder/features/cart/providers/cart_provider.dart';
import 'package:fooder/features/checkout/providers/checkout_provider.dart';
import 'package:fooder/features/common/providers/categories_provider.dart';
import 'package:fooder/features/common/providers/fooder_provider.dart';
import 'package:fooder/features/common/providers/locations_provider.dart';
import 'package:fooder/features/main_bottom_nav/providers/main_bottom_nav_provider.dart';
import 'package:fooder/features/order/provider/order_provider.dart';
import 'package:fooder/features/wish_list/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> appProviders() {
    return [
      ChangeNotifierProvider(create: (_) => MainBottomNavProvider()),
      ChangeNotifierProvider(create: (_) => FooderProvider()),
      ChangeNotifierProvider(create: (_) => LocationsProvider()),
      ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => CheckoutProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => WishListProvider()),
    ];
  }
}
