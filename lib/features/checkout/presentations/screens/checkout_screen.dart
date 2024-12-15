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
      Provider.of<CheckoutProvider>(context, listen: false)
          .loadUpdateTotalCheckoutListPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<CheckoutProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    const Gap(8),
                    _buildDeliveryLocationSection(checkoutProvider),
                    const Gap(8),
                    _buildMyBucketSection(
                      context: context,
                      checkoutProvider: checkoutProvider,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildOrderButton(
            context: context,
            checkoutProvider: checkoutProvider,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderButton({
    required CheckoutProvider checkoutProvider,
    required BuildContext context,
  }) {
    return OrderButton(
      buttonTitle: CheckoutStrings.kPlaceOrderTxt,
      totalItems: checkoutProvider.checkoutFoodList.length,
      totalPrice: checkoutProvider.totalCheckoutFoodPrice(),
      onPressed: () => _onTapOrderButton(
        context: context,
        checkoutProvider: checkoutProvider,
      ),
    );
  }

  void _onTapOrderButton({
    required BuildContext context,
    required CheckoutProvider checkoutProvider,
  }) {
    if (checkoutProvider.checkoutFoodList.isEmpty) {
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
    required CheckoutProvider checkoutProvider,
  }) {
    return Card(
      color: AppColors.kWhiteColor,
      child: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _myBucketHeader(context),
              const Gap(8),
              if (checkoutProvider.checkoutFoodList.isEmpty) const Spacer(),
              _buildCheckoutBucketItemList(checkoutProvider),
              if (checkoutProvider.checkoutFoodList.isEmpty) const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckoutBucketItemList(CheckoutProvider checkoutProvider) {
    return Visibility(
      visible: checkoutProvider.checkoutFoodList.isNotEmpty,
      replacement: const EmptyFoodWidget(
        emptyFoodMessage: CheckoutStrings.kEmptyCheckoutFoodMessage,
      ),
      child: Expanded(
        child: ListView.builder(
          itemCount: checkoutProvider.checkoutFoodList.length,
          itemBuilder: (context, index) {
            return FoodCardTile(
              food: checkoutProvider.checkoutFoodList[index],
              onTapIncrementFood: () => checkoutProvider
                  .incrementFood(checkoutProvider.checkoutFoodList[index]),
              onTapDecrementFood: () => checkoutProvider
                  .decrementFood(checkoutProvider.checkoutFoodList[index]),
              totalFoodItem: checkoutProvider
                  .totalFoodItem(checkoutProvider.checkoutFoodList[index]),
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
        onPressed: _onTapAddItemsButton,
        label: const Text(CheckoutStrings.kAddItemsTxt),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _onTapAddItemsButton() {
    Navigator.of(context)
        .pushNamed(
      RouteNames.foodListScreen,
      arguments: CheckoutStrings.kFoodListAppBarTitle,
    )
        .then(
      (result) {
        if (result == true) {
          if (mounted) {
            Provider.of<CartListProvider>(context, listen: false)
                .updateTotalCartListPrice();
          }
        }
      },
    );
  }

  Widget _buildOrderConfirmationSwitchSection(
      CheckoutProvider checkoutProvider) {
    return Card(
      color: AppColors.kWhiteColor,
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
