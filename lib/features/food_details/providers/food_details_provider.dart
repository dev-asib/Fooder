import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodDetailsProvider extends ChangeNotifier {
  final CartListProvider _cartListProvider;
  final FoodProvider _foodProvider;

  FoodDetailsProvider(
    this._cartListProvider,
    this._foodProvider,
  );

  int totalFoodItem (FoodModel food){
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

  void addToCartListFood({
    required BuildContext context,
    required FoodModel food,
  }) {
    _cartListProvider.addToCartListFood(
      context: context,
      food: food,
    );
  }
}
