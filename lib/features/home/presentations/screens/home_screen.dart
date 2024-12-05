import 'package:flutter/material.dart';
import 'package:fooder/core/constants/paddings/paddings.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/core/widgets/custom_notification_icon.dart';
import 'package:fooder/core/widgets/food_category_card.dart';
import 'package:fooder/core/widgets/food_promo.dart';
import 'package:fooder/core/widgets/location_selector.dart';
import 'package:fooder/features/food_list/presentations/screens/food_list_screen.dart';
import 'package:fooder/features/home/data/entities/home_categories.dart';
import 'package:fooder/features/common/providers/fooder_provider.dart';
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
    Provider.of<FooderProvider>(context, listen: false).loadFooderData();
  }

  @override
  Widget build(BuildContext context) {
    final fooderProvider = Provider.of<FooderProvider>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _buildHomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.kScreenAllPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationSelector(homeProvider: fooderProvider),
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
              _buildFoodPromoSection(textTheme, fooderProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodPromoSection(
      TextTheme textTheme, FooderProvider homProvider) {
    return Column(
      children: [
        _promoHeader(textTheme),
        const Gap(8),
        _buildFoodPromo(homProvider),
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
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FoodListScreen(),
              ),
            );
          },
          child: const Text(HomeStrings.kSeeAllTxt),
        ),
      ],
    );
  }

  Widget _buildFoodPromo(FooderProvider fooderProvider) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: fooderProvider.fooderList.map((fooder) {
          return FoodPromo(fooder: fooder);
        }).toList(),
      ),
    );
  }

  Widget _buildCategorySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: HomeCategories.categories.map(
          (categoryItem) {
            return FoodCategoryCard(
              iconPath: categoryItem.iconPath,
              categoryTitle: categoryItem.categoryName,
            );
          },
        ).toList(),
      ),
    );
  }

  CustomAppBar _buildHomeAppBar() {
    return const CustomAppBar(
      title: HomeStrings.kAppBarTitle,
      actionWidgets: [
        CustomNotificationIcon(),
      ],
    );
  }
}
