import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final fooderProvider = Provider.of<FoodProvider>(context);
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
              fooder: fooderProvider.foodList[index],
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
