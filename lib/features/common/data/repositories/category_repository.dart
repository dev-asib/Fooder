import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class CategoryRepository {
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final String response =
          await rootBundle.loadString(JsonsPaths.kCategoriesJson);
      final List<dynamic> responseBody = json.decode(response);
      return responseBody.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      debugPrint("Error loading categories JSON: $e");
      return [];
    }
  }
}
