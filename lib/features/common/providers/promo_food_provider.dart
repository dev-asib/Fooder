import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class PromoFoodProvider extends ChangeNotifier {
  final FoodProvider _foodProvider;

  PromoFoodProvider(this._foodProvider);

  List<FoodModel> get promoFoodList => _foodProvider.foodList;
}
