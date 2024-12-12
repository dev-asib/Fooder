import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class LocationsProvider extends ChangeNotifier {
  String? _selectedLocation;

  List<LocationModel> _locationList = [];

  String? get selectedLocation => _selectedLocation;

  List<LocationModel> get locationList => _locationList;

  void onChangedLocation(String? newLocation) {
    _selectedLocation = newLocation ?? _locationList.first.address;
    notifyListeners();
  }

  LocationModel? selectedLocationData() {
    return _locationList.firstWhere(
      (location) => location.address == _selectedLocation,
      orElse: () => LocationModel(
        address: '',
        distance: '',
        isVerified: false,
        openTime: '',
      ), // Default LocationModel
    );
  }

  Future<void> locationsData() async {
    try {
      final String response =
          await rootBundle.loadString(JsonsPaths.kLocationsJson);
      final List<dynamic> responseBody = json.decode(response);
      _locationList =
          responseBody.map((json) => LocationModel.fromJson(json)).toList();
      if (_locationList.isNotEmpty) {
        _selectedLocation = _locationList.first.address;
      }
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading json: $e");
    }
  }
}
