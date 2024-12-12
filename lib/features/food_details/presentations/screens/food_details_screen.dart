import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({
    super.key,
    required this.fooder,
  });

  final FoodModel fooder;

  @override
  Widget build(BuildContext context) {
    final locationsProvider = Provider.of<LocationsProvider>(context);
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
                    context,
                    textTheme,
                    locationsProvider,
                  ),
                  const Gap(90),
                  Expanded(
                    child: _buildReviewsAndInfoSection(fooder),
                  ),
                ],
              ),
            ),
            _buildOrderButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderButton() {
    return OrderButton(
      buttonTitle: FoodDetailsStrings.kCheckoutTxt,
      totalItems: 19,
      totalPrice: 20234.23,
      onPressed: () {},
    );
  }

  Widget _buildReviewsAndInfoSection(FoodModel fooder) {
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
            child: _buildReviewsAndInfoView(fooder),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsAndInfoView(FoodModel fooder) {
    return TabBarView(
      children: [
        FoodReviewsView(reviews: fooder.reviewList!),
        FoodInfoView(fooder: fooder),
      ],
    );
  }

  Widget _buildFoodSection(
    BuildContext context,
    TextTheme textTheme,
    LocationsProvider locationProvider,
  ) {
    return Food(
      height: 300,
      width: double.maxFinite,
      imgPath: fooder.imgPath!,
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
            icon: WishIcon(food: fooder),
            alignment: Alignment.topRight,
          ),
          FoodDetailsBox(
            fooder: fooder,
            locations: locationProvider.selectedLocationData()!,
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
