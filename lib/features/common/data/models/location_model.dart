class LocationModel {
  String? address;
  String? distance;
  bool? isVerified;
  String? openTime;

  LocationModel({this.address, this.distance, this.isVerified, this.openTime});

  LocationModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    distance = json['distance'];
    isVerified = json['isVerified'];
    openTime = json['openTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['distance'] = distance;
    data['isVerified'] = isVerified;
    data['openTime'] = openTime;
    return data;
  }
}
