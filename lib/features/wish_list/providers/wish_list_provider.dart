import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListProvider extends ChangeNotifier {
  static const String wishListKey = "wish_list";
  final List<FoodModel> _wishList = [];

  List<FoodModel> get wishList => List.unmodifiable(_wishList);

  Future<void> saveWishList() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String encodedWishList =
        jsonEncode(_wishList.map((food) => food.toJson()).toList());
    await sp.setString(wishListKey, encodedWishList);
  }

  Future<void> loadWishList() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? wishListData = sp.getString(wishListKey);
    if (wishListData != null) {
      List<Map<String, dynamic>> decodedWishList =
          List<Map<String, dynamic>>.from(jsonDecode(wishListData));
      _wishList.clear();
      _wishList.addAll(decodedWishList.map((food) => FoodModel.fromJson(food)));
      notifyListeners();
    }
  }

  void addToWishListFood({
    required BuildContext context,
    required FoodModel food,
  }) async {
    if (_wishList.any((item) => item.id == food.id)) {
      _wishList.removeWhere((item) => item.id == food.id);
      notifyListeners();
      await saveWishList();
      if (context.mounted) {
        AlertMessage.showFlushBarMessage(
          context: context,
          message: "Food Successfully Removed From WishList.",
        );
      }
      return;
    } else {
      _wishList.add(food);
      notifyListeners();
      await saveWishList();

      if (context.mounted) {
        AlertMessage.showFlushBarMessage(
          context: context,
          message: "Food Successfully Added to WishList.",
        );
      }
    }
  }

  bool isAddedFoodToWishList(FoodModel food) {
    return _wishList.any((item) => item.id == food.id);
  }
}
