import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/widgets/custom_app_bar_leading_icon.dart';
import 'package:fooder/core/widgets/food.dart';
import 'package:fooder/core/widgets/food_details_box.dart';
import 'package:fooder/core/widgets/wish_icon.dart';
import 'package:fooder/features/common/providers/locations_provider.dart';
import 'package:fooder/features/food_details/presentations/widgets/food_info_view.dart';
import 'package:fooder/features/food_details/presentations/widgets/food_reviews_view.dart';
import 'package:fooder/features/food_details/utilities/food_details_strings.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({
    super.key,
    required this.fooder,
  });

  final FooderModel fooder;

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
    );
  }

  Widget _buildReviewsAndInfoSection(FooderModel fooder) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: FoodDetailsStrings.reviewsTxt),
              Tab(text: FoodDetailsStrings.infoTxt),
            ],
          ),
          Expanded(
            child: _buildReviewsAndInfoView(fooder),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsAndInfoView(FooderModel fooder) {
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
