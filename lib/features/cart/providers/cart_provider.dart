import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/wrappers/alert_message.dart';

class CartProvider extends ChangeNotifier {
  final List<FooderModel> _cartList = [];
  double _totalCartPrice = 0.0;

  List<FooderModel> get cartList => List.unmodifiable(_cartList);

  double get totalCartPrice => _totalCartPrice;

  void addToCartListFood({
    required BuildContext context,
    required FooderModel food,
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

  bool isAddedFood(FooderModel food) {
    return _cartList.any((item) => item.id == food.id);
  }
}
