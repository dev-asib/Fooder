import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class WishListProvider extends ChangeNotifier {

  final FoodProvider _foodProvider;

  WishListProvider(this._foodProvider);

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


  int totalFoodItem(FoodModel food) {
    return _foodProvider.foodCount[food]?.toInt() ?? 0;
  }

  void incrementFood(FoodModel food) {
    _foodProvider.incrementFood(food);
  }

  void decrementFood(FoodModel food) {
    _foodProvider.decrementFood(food);
  }

  double totalSubFoodPrice(FoodModel food) {
    return _foodProvider.totalSubFoodPrice(food);
  }
}
