import 'package:flutter/material.dart';
import 'package:fooder/core/constants/paddings/paddings.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/core/widgets/food_category_card.dart';
import 'package:fooder/features/category/utilities/constants/category_strings.dart';
import 'package:fooder/features/common/providers/categories_provider.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(title: CategoryStrings.appBarTitle),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.kScreenAllPadding),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.75,
            crossAxisSpacing: 4,
          ),
          itemCount: categoriesProvider.categoryList.length,
          itemBuilder: (context, index) {
            return FoodCategoryCard(
              category: categoriesProvider.categoryList[index],
            );
          },
        ),
      ),
    );
  }
}
