import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.widgets,
    required this.onPressed,
    this.paddingTop = 8,
    this.paddingBottom = 8,
    this.paddingLeft = 8,
    this.paddingRight = 8,
    this.paddingAll = 8,
    this.paddingVertical = 8,
    this.paddingHorizontal = 8,
  });

  final List<Widget> widgets;
  final VoidCallback onPressed;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double paddingAll;
  final double paddingVertical;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widgets,
        ),
      ),
    );
  }
}
