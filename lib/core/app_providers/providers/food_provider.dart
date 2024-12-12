import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodProvider extends ChangeNotifier {
  List<FoodModel> _foodList = [];

  List<FoodModel> get foodList => _foodList;

  Future<void> loadFoodData() async {
    try {
      final String response =
          await rootBundle.loadString(JsonsPaths.kFooderJson);
      final List<dynamic> responseBody = json.decode(response);
      _foodList = responseBody.map((json) => FoodModel.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading json: $e");
    }
  }
}
