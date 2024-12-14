import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
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
        child: Visibility(
          visible: wishListProvider.wishList.isNotEmpty,
          replacement: const EmptyFoodWidget(
            emptyFoodMessage: WishListStrings.kEmptyWishListMessage,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
            ),
            itemCount: wishListProvider.wishList.length,
            itemBuilder: (context, index) {
              return WishFood(
                food: wishListProvider.wishList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
