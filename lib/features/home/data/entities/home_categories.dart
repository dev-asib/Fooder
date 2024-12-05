import 'package:fooder/core/constants/assets_paths/icons_paths.dart';
import 'package:fooder/features/home/data/models/category.dart';

class HomeCategories {
  static List<Category> categories = [
    Category(
      categoryName: "Favorite",
      iconPath: IconsPaths.favoriteIcon,
    ),
    Category(
      categoryName: "Cheap",
      iconPath: IconsPaths.cheapIcon,
    ),
    Category(
      categoryName: "Trend",
      iconPath: IconsPaths.trendIcon,
    ),
    Category(
      categoryName: "More",
      iconPath: IconsPaths.moreIcon,
    ),
  ];
}
