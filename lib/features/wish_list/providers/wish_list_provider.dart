import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/wrappers/alert_message.dart';

class WishListProvider extends ChangeNotifier {
  final List<FooderModel> _wishList = [];

  List<FooderModel> get wishList => List.unmodifiable(_wishList);

  void addToWishListFood({
    required BuildContext context,
    required FooderModel food,
  }) {
    if (_wishList.any((item) => item.id == food.id)) {
      _wishList.removeWhere((item) => item.id == food.id);
      notifyListeners();
      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Removed From WishList.",
      );
      return;
    } else {
      _wishList.add(food);
      notifyListeners();

      AlertMessage.showFlushBarMessage(
        context: context,
        message: "Food Successfully Added to WishList.",
      );
    }
  }

  bool isAddedFoodToWishList(FooderModel food) {
    return _wishList.any((item) => item.id == food.id);
  }
}
