import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class CheckoutProvider extends ChangeNotifier {
  final CartListProvider _cartProvider;
  final FoodProvider _foodProvider;

  CheckoutProvider(
    this._cartProvider,
    this._foodProvider,
  );

  bool _isOrderCancelled = false;

  bool get isOrderCancelled => _isOrderCancelled;

  List<FoodModel> get checkoutFoodList => _cartProvider.cartFoodList;

  double get checkoutTotalPrice => _cartProvider.totalCartPrice;

  void onChangedOrderConfirmation(bool value) {
    _isOrderCancelled = value;
    notifyListeners();
  }

  void loadUpdateTotalCheckoutListPrice() {
    _cartProvider.updateTotalCartListPrice();
  }

  List<FoodModel> get foodList => _foodProvider.foodList;

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

  double totalCheckoutFoodPrice() {
    double totalPrice = 0;
    for (FoodModel food in checkoutFoodList) {
      totalPrice += totalSubFoodPrice(food);
    }
    return totalPrice;
  }
}
