import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodRepository {
  Future<List<FoodModel>> fetchFood() async {
    try {
      final String response = await rootBundle.loadString(JsonsPaths.kFoodJson);
      final List<dynamic> responseBody = json.decode(response);
      return responseBody.map((json) => FoodModel.fromJson(json)).toList();
    } catch (e) {
      debugPrint("Error loading food JSON: $e");
      return [];
    }
  }
}
