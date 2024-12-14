import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodListProvider extends ChangeNotifier {
  final FoodProvider _foodProvider;

  FoodListProvider(this._foodProvider);

  List<FoodModel> get foodList => _foodProvider.foodList;

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
