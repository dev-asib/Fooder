import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/widgets/food.dart';
import 'package:fooder/core/widgets/horizontal_icon_with_text.dart';
import 'package:fooder/core/widgets/wish_icon.dart';
import 'package:fooder/features/food_details/presentations/screens/food_details_screen.dart';

class WishFood extends StatelessWidget {
  const WishFood({
    super.key,
    required this.food,
  });

  final FooderModel food;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsScreen(fooder: food),
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Food(imgPath: food.imgPath!),
              Text(
                food.foodTitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge,
              ),
              Text(
                food.foodDetails!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TK ${food.discountPrice ?? 0}",
                    style: textTheme.bodyLarge,
                  ),
                  HorizontalIconIconWithText(
                    title: "${food.reviewList![0].rating}",
                    icon: Icons.star,
                    middleGap: 1,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: FittedBox(
                      child: WishIcon(food: food),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
