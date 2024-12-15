import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class WishListProvider extends ChangeNotifier {
  final List<FoodModel> _wishList = [];

  List<FoodModel> get wishList => List.unmodifiable(_wishList);

  void addToWishListFood({
    required BuildContext context,
    required FoodModel food,
  }) {
    if (_wishList.any((item) => item.id == food.id)) {
      _wishList.removeWhere((item) => item.id == food.id);
      notifyListeners();
      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Removed From WishList.",
      );
      return;
    } else {
      _wishList.add(food);
      notifyListeners();

      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Added to WishList.",
      );
    }
  }

  bool isAddedFoodToWishList(FoodModel food) {
    return _wishList.any((item) => item.id == food.id);
  }
}
