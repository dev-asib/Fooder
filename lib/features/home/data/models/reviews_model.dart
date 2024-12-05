class ReviewsModel {
  String? user;
  double? rating;
  String? comment;

  ReviewsModel({
    this.user,
    this.rating,
    this.comment,
  });

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['rating'] = rating;
    data['comment'] = comment;
    return data;
  }
}
