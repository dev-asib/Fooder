import 'package:flutter/material.dart';
import 'package:fooder/core/widgets/custom_icon_button.dart';

class WishIcon extends StatefulWidget {
  const WishIcon({super.key});

  @override
  State<WishIcon> createState() => _WishIconState();
}

class _WishIconState extends State<WishIcon> {
  bool iconState = false;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: iconState ? Icons.favorite : Icons.favorite_outline,
      onPressed: () {
        iconState = !iconState;
        setState(() {});
      },
    );
  }
}
