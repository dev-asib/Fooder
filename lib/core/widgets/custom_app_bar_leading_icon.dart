import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class CustomAppBarLeadingIcon extends StatelessWidget {
  const CustomAppBarLeadingIcon({
    super.key,
    required this.onTapAppBarLeadingButton,
  });

  final VoidCallback onTapAppBarLeadingButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: CustomIconButton(
        leftPadding: 8,
        radius: 8,
        icon: Icons.arrow_back_ios,
        onPressed: onTapAppBarLeadingButton,
      ),
    );
  }
}
