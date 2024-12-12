import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
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
          _buildOrderButton(cartProvider, context),
        ],
      ),
    );
  }

  Widget _buildOrderButton(CartProvider cartProvider, BuildContext context) {
    return OrderButton(
      buttonTitle: CheckoutStrings.kPlaceOrderTxt,
      totalItems: cartProvider.cartList.length,
      totalPrice: cartProvider.totalCartPrice,
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
    );
  }

  Widget _buildDeliveryLocationSection(CheckoutProvider checkoutProvider) {
    return FoodDeliveryLocationSection(
      deliveryAddressFormKey: deliveryAddressFormKey,
      deliveryAddressTEController: deliveryAddressTEController,
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
              if (cartProvider.cartList.isEmpty) const Spacer(),
              _buildCartItemList(cartProvider),
              if (cartProvider.cartList.isEmpty) const Spacer(),
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
