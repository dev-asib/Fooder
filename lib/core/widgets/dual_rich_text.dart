import 'package:flutter/material.dart';

class DualRichText extends StatelessWidget {
  const DualRichText({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    this.secondaryTextStyle,
  });

  final String primaryText;
  final String secondaryText;
  final TextStyle? secondaryTextStyle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        style: textTheme.bodyLarge,
        children: [
          TextSpan(text: "$primaryText\t\t"),
          TextSpan(
            style: secondaryTextStyle ??
                textTheme.titleSmall?.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
            text: secondaryText,
          ),
        ],
      ),
    );
  }
}
