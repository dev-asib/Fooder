import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/core/constants/assets_paths/jsons_paths.dart';
import 'package:fooder/core/data/models/fooder_model.dart';

class FooderProvider extends ChangeNotifier {
  List<FooderModel> _fooderList = [];

  List<FooderModel> get fooderList => _fooderList;

  Future<void> loadFooderData() async {
    try {
      final String response =
          await rootBundle.loadString(JsonsPaths.kFooderJson);
      final List<dynamic> responseBody = json.decode(response);
      _fooderList =
          responseBody.map((json) => FooderModel.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading json: $e");
    }
  }
}
