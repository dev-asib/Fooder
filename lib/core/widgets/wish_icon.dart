import 'package:flutter/material.dart';

class WishIcon extends StatefulWidget {
  const WishIcon({super.key});

  @override
  State<WishIcon> createState() => _WishIconState();
}

class _WishIconState extends State<WishIcon> {
  bool iconState = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        iconState = !iconState;
        setState(() {});
      },
      icon: Icon(iconState ? Icons.favorite : Icons.favorite_outline),
    );
  }
}
