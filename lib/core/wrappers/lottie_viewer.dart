import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieViewer extends StatelessWidget {
  const LottieViewer({
    super.key,
    required this.lottiePath,
    this.width = 120,
    this.height = 120,
  });

  final String lottiePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottiePath,
      width: width,
      height: height,
    );
  }
}
