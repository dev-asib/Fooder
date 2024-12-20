import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartListProvider extends ChangeNotifier {
  static const String cartListKey = "cart_list";

  final FoodProvider _foodProvider;

  CartListProvider(this._foodProvider);

  final List<FoodModel> _cartFoodList = [];
  double _totalCartListPrice = 0.0;


  List<FoodModel> get cartFoodList => List.unmodifiable(_cartFoodList);

  double get totalCartPrice => _totalCartListPrice;

  Future<void> saveCartList() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String encodedCartFoodList =
        jsonEncode(_cartFoodList.map((food) => food.toJson()).toList());
    await sp.setString(cartListKey, encodedCartFoodList);
  }

  Future<void> loadCartList() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? cartFoodListData = sp.getString(cartListKey);
    if (cartFoodListData != null) {
      List<Map<String, dynamic>> decodedCartFoodList =
          List<Map<String, dynamic>>.from(jsonDecode(cartFoodListData));
      _cartFoodList.clear();
      _cartFoodList
          .addAll(decodedCartFoodList.map((food) => FoodModel.fromJson(food)));
      notifyListeners();
    }
  }

  /*

  void addToCartListFood({
    required BuildContext context,
    required FoodModel food,
  }) {
    if (_cartFoodList.any((item) => item.id == food.id)) {
      _cartFoodList.removeWhere((item) => item.id == food.id);
      notifyListeners();
      saveCartList();
      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Removed From Cart.",
      );
      return;
    } else {
      _cartFoodList.add(food);
      notifyListeners();
      saveCartList();

      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Added.",
      );
    }
  }
   */


  void addToCartListFood({
    required BuildContext context,
    required FoodModel food,
  }) async {
    if (_cartFoodList.any((item) => item.id == food.id)) {
      _cartFoodList.removeWhere((item) => item.id == food.id);
      notifyListeners();
      await saveCartList();
      if (context.mounted) {
        AlertMessage.showFlushBarMessage(
          context: context,
          message: "Food Successfully Removed From CartList.",
        );
      }
      return;
    } else {
      _cartFoodList.add(food);
      notifyListeners();
      await saveCartList();

      if (context.mounted) {
        AlertMessage.showFlushBarMessage(
          context: context,
          message: "Food Successfully Added to CartList.",
        );
      }
    }
  }

  bool isAddedFoodToCartList(FoodModel food) {
    return _cartFoodList.any((item) => item.id == food.id);
  }

  void updateTotalCartListPrice() {
    _totalCartListPrice = 0.0;
    for (var item in _cartFoodList) {
      _totalCartListPrice += item.discountPrice ?? 0;
      notifyListeners();
    }
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
