import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fooder/core/widgets/centered_circular_progress_indicator.dart';

class SvgViewer extends StatelessWidget {
  const SvgViewer({
    super.key,
    required this.svgAsset,
    this.height = 45,
    this.width = 45,
  });

  final String svgAsset;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (svgAsset.isEmpty) {
      return const Icon(Icons.broken_image_outlined);
    }
    return SvgPicture.asset(
      svgAsset,
      height: height,
      width: width,
      placeholderBuilder: (context) => const CenteredCircularProgressIndicator(),
    );
  }
}

