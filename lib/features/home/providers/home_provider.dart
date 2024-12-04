import 'package:flutter/material.dart';

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

  List<String> get locations => _locations;

  String? get selectedLocation => _selectedLocation;

  void onChangedLocation(String? newLocation) {
    _selectedLocation = newLocation;
    notifyListeners();
  }
}
