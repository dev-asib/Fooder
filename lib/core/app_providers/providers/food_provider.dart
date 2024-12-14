import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodProvider extends ChangeNotifier {
  final FoodRepository _foodRepository;

  FoodProvider(this._foodRepository);

  List<FoodModel> _foodList = [];
  Map<FoodModel, int> _foodCount = {};

  List<FoodModel> get foodList => _foodList;

  Map<FoodModel, int> get foodCount => _foodCount;

  void incrementFood(FoodModel food) {
    if (_foodList.any((foodItem) => foodItem.id == food.id)) {
      _foodCount[food] = (_foodCount[food] ?? 0) + 1;
      notifyListeners();
    }
  }

  void decrementFood(FoodModel food) {
    if (_foodList.any((foodItem) => foodItem.id == food.id)) {
      if (_foodCount[food] != null && _foodCount[food]! > 0) {
        _foodCount[food] = _foodCount[food]! - 1;
        notifyListeners();
      }
    }
  }

  double totalSubFoodPrice(FoodModel food) {
    int count = _foodCount[food] ?? 0;
    return food.discountPrice! * count;
  }

  Future<void> loadFood() async {
    _foodList = await _foodRepository.fetchFood();
    notifyListeners();
  }
}
