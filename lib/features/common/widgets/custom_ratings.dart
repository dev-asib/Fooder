import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

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
