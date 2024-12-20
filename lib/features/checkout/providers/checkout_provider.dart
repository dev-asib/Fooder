import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutProvider extends ChangeNotifier {
  static const String checkoutListKey = "checkout_list";

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


  Future<void> saveCheckoutList() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String encodedCheckoutFoodList =
    jsonEncode(checkoutFoodList.map((food) => food.toJson()).toList());
    await sp.setString(checkoutListKey, encodedCheckoutFoodList);
  }

  Future<void> loadCheckoutList() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? checkoutFoodListData = sp.getString(checkoutListKey);
    if (checkoutFoodListData != null) {
      List<Map<String, dynamic>> decodedCheckoutFoodList =
      List<Map<String, dynamic>>.from(jsonDecode(checkoutFoodListData));
      checkoutFoodList.clear();
      checkoutFoodList
          .addAll(decodedCheckoutFoodList.map((food) => FoodModel.fromJson(food)));
      notifyListeners();
    }
  }


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
