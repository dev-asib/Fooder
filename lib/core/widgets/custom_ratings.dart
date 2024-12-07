import 'package:flutter/material.dart';
import 'package:fooder/core/widgets/horizontal_icon_with_text.dart';

class CustomRatings extends StatelessWidget {
  const CustomRatings({
    super.key,
    required this.ratings,
  });

  final double ratings;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: HorizontalIconIconWithText(
        title: "$ratings",
        icon: Icons.star,
      ),
    );
  }
}
