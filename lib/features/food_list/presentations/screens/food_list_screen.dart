import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)?.settings.arguments as String?;
    assert(categoryName != null, "Category name must be a non-null String");

    final foodListProvider = Provider.of<FoodListProvider>(context);
    return Scaffold(
      appBar: _buildAppBar(
        context: context,
        categoryName: categoryName!,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.kScreenAllPadding),
        child: ListView.builder(
          itemCount: foodListProvider.foodList.length,
          itemBuilder: (context, index) {
            return FoodCardTile(
              food: foodListProvider.foodList[index],
              onTapIncrementFood: () => foodListProvider.incrementFood(
                foodListProvider.foodList[index],
              ),
              onTapDecrementFood: () => foodListProvider.decrementFood(
                foodListProvider.foodList[index],
              ),
              totalFoodItem: foodListProvider.totalFoodItem(
                foodListProvider.foodList[index],
              ),
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
