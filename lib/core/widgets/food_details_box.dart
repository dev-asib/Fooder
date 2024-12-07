import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/data/models/location_model.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/dual_rich_text.dart';
import 'package:fooder/core/widgets/horizontal_icon_with_text.dart';

class FoodDetailsBox extends StatelessWidget {
  const FoodDetailsBox({
    super.key,
    required this.fooder,
    required this.locations,
  });

  final FooderModel fooder;
  final LocationModel locations;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Positioned(
      bottom: -80,
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTitleText(textTheme),
              _buildLocationText(
                textTheme,
                locations,
              ),
              _buildOperationalTime(
                textTheme,
                locations,
              ),
              _buildFoodInfoRow(
                locations,
                fooder,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodInfoRow(
    LocationModel locations,
    FooderModel fooder,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HorizontalIconIconWithText(
          title: locations.distance!,
          icon: Icons.my_location_sharp,
        ),
        HorizontalIconIconWithText(
          title: fooder.reviewList![0].rating.toString(),
          icon: Icons.star,
        ),
        const HorizontalIconIconWithText(
          title: "Verified",
          icon: Icons.verified_outlined,
        ),
      ],
    );
  }

  Widget _buildTitleText(TextTheme textTheme) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      fooder.foodTitle!,
      style: textTheme.titleMedium,
    );
  }

  Widget _buildLocationText(
    TextTheme textTheme,
    LocationModel locations,
  ) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      locations.address!,
      style: textTheme.bodyLarge,
    );
  }

  Widget _buildOperationalTime(
    TextTheme textTheme,
    LocationModel locations,
  ) {
    return DualRichText(
      primaryText: "Open\t\t",
      secondaryText: locations.openTime!,
      secondaryTextStyle: textTheme.titleSmall,
    );
  }
}
