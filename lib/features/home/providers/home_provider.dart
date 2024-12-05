import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/core/constants/assets_paths/jsons_paths.dart';
import 'package:fooder/features/home/data/models/fooder_model.dart';

class HomeProvider extends ChangeNotifier {
  final List<String> _locations = [
    "JI. Jayakatwang no 301",
    "JI. Jayakatwang no 302",
    "JI. Jayakatwang no 303",
    "JI. Jayakatwang no 304",
    "JI. Jayakatwang no 305",
    "JI. Jayakatwang no 306",
    "JI. Jayakatwang no 307",
    "JI. Jayakatwang no 308",
    "JI. Jayakatwang no 309",
    "JI. Jayakatwang no 400",
  ];

  String? _selectedLocation;

  List<FooderModel> _fooderList = [];

  List<String> get locations => _locations;

  String? get selectedLocation => _selectedLocation;

  List<FooderModel> get fooderList => _fooderList;

  void onChangedLocation(String? newLocation) {
    _selectedLocation = newLocation;
    notifyListeners();
  }

  Future<void> loadFooderData() async {
    try {
      final String response =
          await rootBundle.loadString(JsonsPaths.kFooderJson);
      final List<dynamic> responseBody = json.decode(response);
      _fooderList = responseBody.map((json) => FooderModel.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading json: $e");
    }
  }
}
