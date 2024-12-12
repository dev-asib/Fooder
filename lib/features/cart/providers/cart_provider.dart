import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class CartProvider extends ChangeNotifier {
  final List<FoodModel> _cartList = [];
  double _totalCartPrice = 0.0;

  List<FoodModel> get cartList => List.unmodifiable(_cartList);

  double get totalCartPrice => _totalCartPrice;

  void addToCartListFood({
    required BuildContext context,
    required FoodModel food,
  }) {
    if (_cartList.any((item) => item.id == food.id)) {
      _cartList.removeWhere((item) => item.id == food.id);
      notifyListeners();
      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Removed From Cart.",
      );
      return;
    } else {
      _cartList.add(food);
      notifyListeners();

      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Added.",
      );
    }
  }

  void updateTotalCartPrice() {
    _totalCartPrice = 0.0;
    for (var item in _cartList) {
      _totalCartPrice += item.discountPrice ?? 0;
      notifyListeners();
    }
  }

  bool isAddedFood(FoodModel food) {
    return _cartList.any((item) => item.id == food.id);
  }
}
