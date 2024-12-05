import 'package:fooder/features/home/data/models/reviews_model.dart';

class FooderModel {
  int? id;
  String? foodTitle;
  String? foodDetails;
  double? originalPrice;
  double? discountPrice;
  int? stockCount;
  String? imgPath;
  int? totalReviews;
  List<ReviewsModel>? reviewList;
  bool? isFavorite;

  FooderModel({
    this.id,
    this.foodTitle,
    this.foodDetails,
    this.originalPrice,
    this.discountPrice,
    this.stockCount,
    this.imgPath,
    this.totalReviews,
    this.reviewList,
    this.isFavorite,
  });

  FooderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodTitle = json['foodTitle'];
    foodDetails = json['foodDetails'];
    originalPrice = json['originalPrice'];
    discountPrice = json['discountPrice'];
    stockCount = json['stockCount'];
    imgPath = json['imgPath'];
    totalReviews = json['total_reviews'];
    if (json['reviews'] != null) {
      reviewList = <ReviewsModel>[];
      json['reviews'].forEach((v) {
        reviewList!.add(ReviewsModel.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['foodTitle'] = foodTitle;
    data['foodDetails'] = foodDetails;
    data['originalPrice'] = originalPrice;
    data['discountPrice'] = discountPrice;
    data['stockCount'] = stockCount;
    data['imgPath'] = imgPath;
    data['total_reviews'] = totalReviews;
    if (reviewList != null) {
      data['reviews'] = reviewList!.map((v) => v.toJson()).toList();
    }
    data['isFavorite'] = isFavorite;
    return data;
  }
}
