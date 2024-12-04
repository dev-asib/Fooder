import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/core/widgets/custom_icon_button.dart';
import 'package:fooder/core/widgets/food_promo.dart';
import 'package:fooder/core/widgets/location_selector.dart';
import 'package:fooder/features/home/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: _buildHomeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocationSelector(
            homeProvider: homProvider,
          ),
          FoodPromo(),
        ],
      ),
    );
  }

  CustomAppBar _buildHomeAppBar() {
    return CustomAppBar(
      title: 'Fooder',
      actionWidgets: [
        CustomIconButton(
          icon: Icons.notifications_outlined,
          onPressed: () {},
          bgColor: AppColors.kPrimaryColor,
          fgColor: AppColors.kWhiteColor,
        ),
      ],
    );
  }
}
