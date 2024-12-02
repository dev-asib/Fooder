import 'package:flutter/material.dart';
import 'package:fooder/core/constants/assets_paths/assets_paths.dart';

class Food extends StatelessWidget {
  const Food({
    super.key,
    this.imgPath = AssetsPaths.food,
    this.width = 180,
    this.height = 100,
    this.radius = 8,
    this.widget,
  });

  final String imgPath;
  final double width;
  final double height;
  final double radius;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.fill,
        ),
      ),
      child: widget,
    );
  }
}
