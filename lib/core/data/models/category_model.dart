class CategoryModel {
  String? categoryName;
  String? iconPath;

  CategoryModel({this.categoryName, this.iconPath});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    iconPath = json['iconPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryName'] = categoryName;
    data['iconPath'] = iconPath;
    return data;
  }
}
