import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class HomeProvider extends ChangeNotifier {
  final CategoriesProvider _categoriesProvider;
  final PromoFoodProvider _promoFoodProvider;
  final LocationsProvider _locationsProvider;

  HomeProvider(
    this._categoriesProvider,
    this._promoFoodProvider,
    this._locationsProvider,
  );

  List<FoodModel> get homePromoFoodList => _promoFoodProvider.promoFoodList;

  List<LocationModel> get homeLocationList => _locationsProvider.locationList;

  List<CategoryModel> get homeCategoryList {
    return _categoriesProvider.categories.length >= 4
        ? _categoriesProvider.categories.take(4).toList()
        : _categoriesProvider.categories;
  }

  String? get selectedLocation => _locationsProvider.selectedLocation;

  void onChangedHomeLocation(String? newLocation) {
    _locationsProvider.onChangedLocation(newLocation);
  }
}
