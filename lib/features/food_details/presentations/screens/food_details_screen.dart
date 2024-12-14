import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)?.settings.arguments as FoodModel?;
    assert(food != null, "food must be a non-null FoodModel");

    final locationsProvider = Provider.of<LocationsProvider>(context);
    final foodDetailsProvider = Provider.of<FoodDetailsProvider>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildFoodSection(
                    context: context,
                    textTheme: textTheme,
                    locationsProvider: locationsProvider,
                    food: food!,
                  ),
                  const Gap(90),
                  Expanded(
                    child: _buildReviewsAndInfoSection(
                      food: food,
                      foodDetailsProvider: foodDetailsProvider,
                    ),
                  ),
                ],
              ),
            ),
            _buildOrderButton(
              context: context,
              food: food,
              foodDetailsProvider: foodDetailsProvider,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderButton({
    required BuildContext context,
    required FoodModel food,
    required FoodDetailsProvider foodDetailsProvider,
  }) {
    return OrderButton(
      buttonTitle: FoodDetailsStrings.kCheckoutTxt,
      totalItems: foodDetailsProvider.totalFoodItem(food),
      totalPrice: foodDetailsProvider.totalSubFoodPrice(food),
      onPressed: () => _onTapOrderButton(
        context: context,
        food: food,
        foodDetailsProvider: foodDetailsProvider,
      ),
    );
  }

  void _onTapOrderButton({
    required BuildContext context,
    required FoodModel food,
    required FoodDetailsProvider foodDetailsProvider,
  }) {
    if (foodDetailsProvider.totalFoodItem(food) > 0) {
      foodDetailsProvider.addToCartListFood(
        context: context,
        food: food,
      );
      Navigator.of(context).pushNamed(RouteNames.checkoutScreen);
    } else {
      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food must be 1 or more than 1.",
      );
    }
  }

  Widget _buildReviewsAndInfoSection({
    required FoodModel food,
    required FoodDetailsProvider foodDetailsProvider,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: FoodDetailsStrings.kReviewsTxt),
              Tab(text: FoodDetailsStrings.kInfoTxt),
            ],
          ),
          Expanded(
            child: _buildReviewsAndInfoView(
              food: food,
              foodDetailsProvider: foodDetailsProvider,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsAndInfoView({
    required FoodModel food,
    required FoodDetailsProvider foodDetailsProvider,
  }) {
    return TabBarView(
      children: [
        FoodReviewsView(reviews: food.reviewList!),
        FoodInfoView(
          food: food,
          onTapIncrementFood: () => foodDetailsProvider.incrementFood(food),
          onTapDecrementFood: () => foodDetailsProvider.decrementFood(food),
          totalFoodCount: foodDetailsProvider.totalFoodItem(food),
        ),
      ],
    );
  }

  Widget _buildFoodSection({
    required BuildContext context,
    required TextTheme textTheme,
    required LocationsProvider locationsProvider,
    required FoodModel food,
  }) {
    return Food(
      height: 300,
      width: double.maxFinite,
      imgPath: food.imgPath!,
      widget: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          _buildTopIcon(
            icon: CustomAppBarLeadingIcon(
              onTapAppBarLeadingButton: () => Navigator.pop(context),
            ),
            alignment: Alignment.topLeft,
          ),
          _buildTopIcon(
            icon: WishIcon(food: food),
            alignment: Alignment.topRight,
          ),
          FoodDetailsBox(
            food: food,
            locations: locationsProvider.selectedLocationData()!,
          ),
        ],
      ),
    );
  }

  Widget _buildTopIcon({
    required Widget icon,
    required AlignmentGeometry alignment,
  }) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 0,
          top: 40,
          right: 16,
        ),
        child: icon,
      ),
    );
  }
}
