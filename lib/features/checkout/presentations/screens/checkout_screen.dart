import 'package:flutter/material.dart';
import 'package:fooder/core/constants/paddings/paddings.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/core/widgets/custom_app_bar_leading_icon.dart';
import 'package:fooder/core/widgets/custom_button.dart';
import 'package:fooder/core/widgets/empty_food_widget.dart';
import 'package:fooder/core/widgets/food_card_tile.dart';
import 'package:fooder/core/widgets/text_with_button_row.dart';
import 'package:fooder/core/wrappers/alert_message.dart';
import 'package:fooder/features/checkout/presentations/widgets/food_delivery_location_section.dart';
import 'package:fooder/features/cart/providers/cart_provider.dart';
import 'package:fooder/features/checkout/providers/checkout_provider.dart';
import 'package:fooder/features/checkout/utilites/checkout_strings/check_out_strings.dart';
import 'package:fooder/features/food_list/presentations/screens/food_list_screen.dart';
import 'package:fooder/features/order/presentations/screens/order_screen.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final GlobalKey<FormState> deliveryAddressFormKey = GlobalKey<FormState>();
  final TextEditingController deliveryAddressTEController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartProvider>(context, listen: false).updateTotalCartPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final checkoutProvider = Provider.of<CheckoutProvider>(context);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Paddings.kScreenAllPadding),
                child: Column(
                  children: [
                    _buildOrderConfirmationSwitchSection(checkoutProvider),
                    _buildDeliveryLocationSection(checkoutProvider),
                    _buildMyBucketSection(
                      context: context,
                      cartProvider: cartProvider,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildOrderSummaryButton(
            context: context,
            cartProvider: cartProvider,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryLocationSection(CheckoutProvider checkoutProvider) {
    return FoodDeliveryLocationSection(
      deliveryAddressFormKey: deliveryAddressFormKey,
      deliveryAddressTEController: deliveryAddressTEController,
    );
  }

  Widget _buildOrderSummaryButton({
    required BuildContext context,
    required CartProvider cartProvider,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: AppColors.kWhiteColor,
        ),
      ),
      child: CustomButton(
        padding: 0,
        widgets: [
          Text("${cartProvider.cartList.length} Items"),
          const Spacer(),
          const Text("Place Order"),
          const Spacer(),
          Text("TK ${cartProvider.totalCartPrice.toStringAsFixed(2)}"),
        ],
        onPressed: () {
          if (cartProvider.cartList.isEmpty) {
            AlertMessage.showFlushBarMessage(
              context: context,
              message: "Cart is Empty! Please add item.",
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: CheckoutStrings.kAppBarTitle,
      leadingWidget: CustomAppBarLeadingIcon(
        onTapAppBarLeadingButton: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildMyBucketSection({
    required BuildContext context,
    required CartProvider cartProvider,
  }) {
    return Card(
      child: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _myBucketHeader(context),
              const Gap(8),
              const Spacer(),
              _buildCartItemList(cartProvider),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItemList(CartProvider cartProvider) {
    return Visibility(
      visible: cartProvider.cartList.isNotEmpty,
      replacement: const EmptyFoodWidget(
        emptyFoodMessage: CheckoutStrings.kEmptyCheckoutFoodMessage,
      ),
      child: Expanded(
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

  Widget _myBucketHeader(BuildContext context) {
    return TextWithButtonRow(
      contentTitle: CheckoutStrings.kMyBucketTxt,
      button: TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FoodListScreen(
                categoryName: CheckoutStrings.kFoodListAppBarTitle,
              ),
            ),
          ).then(
            (result) {
              if (result == true) {
                if (context.mounted) {
                  Provider.of<CartProvider>(context, listen: false)
                      .updateTotalCartPrice();
                }
              }
            },
          );
        },
        label: const Text(CheckoutStrings.kAddItemsTxt),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildOrderConfirmationSwitchSection(
      CheckoutProvider checkoutProvider) {
    return Card(
      child: ListTile(
        title: const Text(CheckoutStrings.kOrderDoorStepTitle),
        subtitle: const Text(CheckoutStrings.kOrderDoorStepSubTitle),
        trailing: Switch(
          inactiveTrackColor: AppColors.kGreyColor.withOpacity(0.4),
          inactiveThumbColor: AppColors.kWhiteColor,
          value: checkoutProvider.isOrderCancelled,
          onChanged: checkoutProvider.onChangedOrderConfirmation,
        ),
      ),
    );
  }
}
