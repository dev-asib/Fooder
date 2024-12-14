import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class CategoriesProvider extends ChangeNotifier {
  final CategoryRepository _categoryRepository;

  CategoriesProvider(this._categoryRepository);

  List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categories => _categoryList;

  List<CategoryModel> get categoryList {
    return _categoryList
        .where((category) => category.categoryName != "More")
        .toList();
  }

  Future<void> loadCategories() async {
    _categoryList = await _categoryRepository.fetchCategories();
    notifyListeners();
  }
}
