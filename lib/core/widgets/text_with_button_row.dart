import 'package:flutter/material.dart';

class TextWithButtonRow extends StatelessWidget {
  const TextWithButtonRow({
    super.key,
    required this.contentTitle,
    required this.button,
  });

  final String contentTitle;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          contentTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
        ),
        button
      ],
    );
  }
}
