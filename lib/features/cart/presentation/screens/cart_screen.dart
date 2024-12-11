import 'package:flutter/material.dart';
import 'package:fooder/core/constants/assets_paths/icons_paths.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/core/widgets/empty_food_widget.dart';
import 'package:fooder/core/widgets/food_card_tile.dart';
import 'package:fooder/core/wrappers/svg_viewer.dart';
import 'package:fooder/features/cart/providers/cart_provider.dart';
import 'package:fooder/features/cart/utilities/constants/cart_strings.dart';
import 'package:fooder/features/checkout/presentations/screens/checkout_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: _buildCartAppBar(context),
      body: Visibility(
        visible: cartProvider.cartList.isNotEmpty,
        replacement: const EmptyFoodWidget(
          emptyFoodMessage: CartStrings.kEmptyCartMessage,
        ),
        child: ListView.builder(
          itemCount: cartProvider.cartList.length,
          itemBuilder: (context, index) {
            return FoodCardTile(
              fooder: cartProvider.cartList[index],
            );
          },
        ),
      ),
    );
  }

  CustomAppBar _buildCartAppBar(BuildContext context) {
    return CustomAppBar(
      title: CartStrings.kAppBarTitle,
      actionWidgets: [
        _buildOnTapCheckout(context),
      ],
    );
  }

  Widget _buildOnTapCheckout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SvgViewer(
        height: 40,
        width: 40,
        svgAsset: IconsPaths.kCheckoutSvg,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckoutScreen(),
            ),
          );
        },
      ),
    );
  }
}
