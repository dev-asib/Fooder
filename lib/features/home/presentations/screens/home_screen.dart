import 'package:flutter/material.dart';
import 'package:fooder/core/constants/paddings/paddings.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/core/widgets/custom_notification_icon.dart';
import 'package:fooder/core/widgets/food_category_card.dart';
import 'package:fooder/core/widgets/food_promo.dart';
import 'package:fooder/core/widgets/location_selector.dart';
import 'package:fooder/features/home/data/entities/home_categories.dart';
import 'package:fooder/features/home/providers/home_provider.dart';
import 'package:fooder/features/home/utilities/constants/home_strings.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).loadFooderData();
  }

  @override
  Widget build(BuildContext context) {
    final homProvider = Provider.of<HomeProvider>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _buildHomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.kScreenAllPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocationSelector(homeProvider: homProvider),
            const Gap(24),
            Text(
              HomeStrings.kUserCongratulationTxt,
              style: textTheme.titleLarge,
            ),
            Text(
              HomeStrings.kQuestionTxt,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            const Gap(8),
            _buildCategorySection(),
            const Gap(24),
            Expanded(
              child: _buildFoodPromoSection(textTheme, homProvider),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodPromoSection(TextTheme textTheme, HomeProvider homProvider) {
    return Column(
      children: [
        _promoHeader(textTheme),
        const Gap(8),
        Expanded(
          child: _buildFoodPromo(homProvider),
        ),
      ],
    );
  }

  Widget _promoHeader(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          HomeStrings.kTodayPromoTxt,
          style: textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w500, fontSize: 28),
        ),
        Text(
          HomeStrings.kSeeAllTxt,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildFoodPromo(HomeProvider homProvider) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: homProvider.fooderList.length,
      itemBuilder: (context, index) {
        return FoodPromo(
          fooder: homProvider.fooderList[index],
        );
      },
      separatorBuilder: (_, __) {
        return const Gap(8);
      },
    );
  }

  Widget _buildCategorySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: HomeCategories.categories.map((categoryItem) {
        return FoodCategoryCard(
          iconPath: categoryItem.iconPath,
          categoryTitle: categoryItem.categoryName,
        );
      }).toList(),
    );
  }

  CustomAppBar _buildHomeAppBar() {
    return const CustomAppBar(
      title: 'Fooder',
      fontFamily: "BlackOpsOne",
      fontColor: AppColors.kPrimaryColor,
      actionWidgets: [
        CustomNotificationIcon(),
      ],
    );
  }
}
