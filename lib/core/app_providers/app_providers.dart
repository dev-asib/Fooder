import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> appProviders() {
    return [
      ChangeNotifierProvider(create: (_) => MainBottomNavProvider()),
      ChangeNotifierProvider(create: (_) => FoodProvider()),
      ChangeNotifierProvider(create: (_) => LocationsProvider()),
      ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => CheckoutProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => WishListProvider()),
    ];
  }
}
