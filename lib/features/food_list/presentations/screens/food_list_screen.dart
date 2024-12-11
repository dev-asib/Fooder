import 'package:flutter/material.dart';
import 'package:fooder/core/constants/paddings/paddings.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/core/widgets/custom_app_bar_leading_icon.dart';
import 'package:fooder/core/widgets/food_card_tile.dart';
import 'package:fooder/features/common/providers/fooder_provider.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final fooderProvider = Provider.of<FooderProvider>(context);
    return Scaffold(
      appBar: _buildAppBar(
        context: context,
        categoryName: categoryName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.kScreenAllPadding),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return FoodCardTile(
              fooder: fooderProvider.fooderList[index],
            );
          },
        ),
      ),
    );
  }

  CustomAppBar _buildAppBar({
    required BuildContext context,
    required String categoryName,
  }) {
    return CustomAppBar(
      leadingWidget: CustomAppBarLeadingIcon(
        onTapAppBarLeadingButton: () => Navigator.pop(context, true),
      ),
      title: categoryName,
    );
  }
}
