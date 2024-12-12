import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomIconButton(
            icon: Icons.notifications_outlined,
            onPressed: () {},
            bgColor: AppColors.kPrimaryColor,
            fgColor: AppColors.kWhiteColor,
          ),
          Positioned(
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: AppColors.kAmberYellowColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: AppColors.kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
