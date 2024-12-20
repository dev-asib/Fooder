import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';

class FoodReviewsView extends StatelessWidget {
  const FoodReviewsView({
    super.key,
    required this.reviews,
  });

  final List<ReviewsModel> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return _buildReviewCard(index);
      },
      separatorBuilder: (_, __) {
        return const Gap(2);
      },
    );
  }

  Widget _buildReviewCard(int index) {
    return  Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(
            Icons.reviews,
            color: AppColors.kAmberYellowColor,
          ),
        ),
        title: Row(
          children: [
            Text(reviews[index].user!),
            const Spacer(),
            CustomRatings(
              ratings: reviews[index].rating!,
            ),
          ],
        ),
        subtitle: Text(reviews[index].comment!),
      ),
    );
  }
}
