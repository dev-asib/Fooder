import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';

class Food extends StatelessWidget {
  const Food({
    super.key,
    required this.imgPath,
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
    return Card(
      color: AppColors.kWhiteColor,
      child: Container(
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
      ),
    );
  }
}
