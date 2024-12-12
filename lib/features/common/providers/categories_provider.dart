import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class CategoriesProvider extends ChangeNotifier {
  List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categoryList {
    return _categoryList
        .where((category) => category.categoryName != "More")
        .toList();
  }

  List<CategoryModel> homeCategory() {
    return _categoryList.isNotEmpty ? _categoryList.take(4).toList() : [];
  }

  Future<void> loadCategoryData() async {
    try {
      final String response =
          await rootBundle.loadString(JsonsPaths.kCategoriesJson);
      final List<dynamic> responseBody = json.decode(response);
      _categoryList =
          responseBody.map((json) => CategoryModel.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading json: $e");
    }
  }
}
