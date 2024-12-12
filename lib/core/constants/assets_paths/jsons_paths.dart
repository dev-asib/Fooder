import 'package:fooder/core/exported_files/exported_files.dart';

class JsonsPaths {
  static final String _kJsonsBasePath =
      "${AssetsBasePath.kAssetsBasePath}/jsons";

  static String kFooderJson = "$_kJsonsBasePath/fooder_data.json";
  static String kCategoriesJson = "$_kJsonsBasePath/categories.json";
  static String kLocationsJson = "$_kJsonsBasePath/locations.json";
}
