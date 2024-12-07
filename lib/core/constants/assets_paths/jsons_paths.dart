import 'package:fooder/core/constants/assets_paths/assets_base_path.dart';

class JsonsPaths {
  static final String _kJsonsBasePath =
      "${AssetsBasePath.kAssetsBasePath}/jsons";

  static String kFooderJson = "$_kJsonsBasePath/fooder_data.json";
  static String kCategoriesJson = "$_kJsonsBasePath/categories.json";
  static String kLocationsJson = "$_kJsonsBasePath/locations.json";
}
