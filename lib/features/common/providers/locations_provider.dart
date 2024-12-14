import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class LocationsProvider extends ChangeNotifier {
  final LocationRepository _locationRepository;

  LocationsProvider(this._locationRepository);

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

  Future<void> loadLocations() async {
    _locationList = await _locationRepository.fetchLocations();
    if (_locationList.isNotEmpty) {
      _selectedLocation = _locationList.first.address;
    }
  }
}
