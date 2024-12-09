import 'package:flutter/material.dart';
import 'package:fooder/core/constants/paddings/paddings.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/features/wish_list/presentation/widgets/wish_food.dart';
import 'package:fooder/features/wish_list/providers/wish_list_provider.dart';
import 'package:fooder/features/wish_list/utilities/constants/wish_list_strings.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(title: WishListStrings.kAppBarTitle),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.kScreenAllPadding),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.95,
          ),
          itemCount: wishListProvider.wishList.length,
          itemBuilder: (context, index) {
            return WishFood(
              food: wishListProvider.wishList[index],
            );
          },
        ),
      ),
    );
  }
}
