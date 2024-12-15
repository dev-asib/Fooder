import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class CartListProvider extends ChangeNotifier {
  final FoodProvider _foodProvider;

  CartListProvider(this._foodProvider);

  final List<FoodModel> _cartFoodList = [];
  double _totalCartListPrice = 0.0;

  List<FoodModel> get cartFoodList => List.unmodifiable(_cartFoodList);

  double get totalCartPrice => _totalCartListPrice;

  void addToCartListFood({
    required BuildContext context,
    required FoodModel food,
  }) {
    if (_cartFoodList.any((item) => item.id == food.id)) {
      _cartFoodList.removeWhere((item) => item.id == food.id);
      notifyListeners();
      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Removed From Cart.",
      );
      return;
    } else {
      _cartFoodList.add(food);
      notifyListeners();

      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Added.",
      );
    }
  }

  void updateTotalCartListPrice() {
    _totalCartListPrice = 0.0;
    for (var item in _cartFoodList) {
      _totalCartListPrice += item.discountPrice ?? 0;
      notifyListeners();
    }
  }

  bool isAddedFood(FoodModel food) {
    return _cartFoodList.any((item) => item.id == food.id);
  }

  int totalFoodItem(FoodModel food) {
    return _foodProvider.foodCount[food]?.toInt() ?? 1;
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
