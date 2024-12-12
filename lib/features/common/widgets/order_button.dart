import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.buttonTitle,
    required this.totalItems,
    required this.totalPrice,
    required this.onPressed,
  });

  final String buttonTitle;
  final int totalItems;
  final double totalPrice;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: AppColors.kWhiteColor,
        ),
      ),
      child: CustomButton(
        padding: 0,
        widgets: [
          Text("$totalItems items"),
          const Spacer(),
          Text(buttonTitle),
          const Spacer(),
          Text("TK ${totalPrice.toStringAsFixed(2)}"),
        ],
        onPressed: onPressed,
      ),
    );
  }
}
