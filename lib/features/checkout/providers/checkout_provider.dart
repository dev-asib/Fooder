import 'package:flutter/material.dart';

class CheckoutProvider extends ChangeNotifier {

  bool _isOrderCancelled = false;

  bool get isOrderCancelled => _isOrderCancelled;

  void onChangedOrderConfirmation(bool value) {
    _isOrderCancelled = value;
    notifyListeners();
  }
}
