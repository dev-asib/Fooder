import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class LocationRepository {
  Future<List<LocationModel>> fetchLocations() async {
    try {
      final String response =
          await rootBundle.loadString(JsonsPaths.kLocationsJson);
      final List<dynamic> responseBody = json.decode(response);

      return responseBody.map((json) => LocationModel.fromJson(json)).toList();
    } catch (e) {
      debugPrint("Error loading json: $e");
      return [];
    }
  }
}
