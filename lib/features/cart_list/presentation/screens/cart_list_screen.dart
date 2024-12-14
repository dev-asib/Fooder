import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartListProvider>(context);
    return Scaffold(
      appBar: _buildCartAppBar(context),
      body: Visibility(
        visible: cartProvider.cartFoodList.isNotEmpty,
        replacement: const EmptyFoodWidget(
          emptyFoodMessage: CartStrings.kEmptyCartMessage,
        ),
        child: ListView.builder(
          itemCount: cartProvider.cartFoodList.length,
          itemBuilder: (context, index) {
            return FoodCardTile(
              food: cartProvider.cartFoodList[index],
              onTapIncrementFood: () =>
                  cartProvider.incrementFood(cartProvider.cartFoodList[index]),
              onTapDecrementFood: () => cartProvider.incrementFood(
                cartProvider.cartFoodList[index],
              ),
              totalFoodItem: cartProvider.totalFoodItem(
                cartProvider.cartFoodList[index],
              ),
              totalSubFoodPrice: cartProvider
                  .totalSubFoodPrice(cartProvider.cartFoodList[index]),
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
        onTap: () => _onTapCheckoutButton(context),
      ),
    );
  }

  void _onTapCheckoutButton(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.checkoutScreen);
  }
}
