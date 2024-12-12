import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
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
