import 'package:flutter/material.dart';
import 'package:fooder/core/constants/paddings/paddings.dart';
import 'package:fooder/core/data/models/category_model.dart';
import 'package:fooder/core/widgets/centered_circular_progress_indicator.dart';
import 'package:fooder/core/widgets/custom_app_bar.dart';
import 'package:fooder/core/widgets/custom_notification_icon.dart';
import 'package:fooder/core/widgets/food_category_card.dart';
import 'package:fooder/core/widgets/food_promo.dart';
import 'package:fooder/core/widgets/location_selector.dart';
import 'package:fooder/core/widgets/text_with_button_row.dart';
import 'package:fooder/features/common/providers/categories_provider.dart';
import 'package:fooder/features/common/providers/locations_provider.dart';
import 'package:fooder/features/food_list/presentations/screens/food_list_screen.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeProviders(context);
    });
  }

  Future<void> _initializeProviders(BuildContext context) async {
    await Future.wait([
      Provider.of<FooderProvider>(context, listen: false).loadFooderData(),
      Provider.of<LocationsProvider>(context, listen: false).locationsData(),
      Provider.of<CategoriesProvider>(context, listen: false)
          .loadCategoryData(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final fooderProvider = Provider.of<FooderProvider>(context);
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
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
              const LocationSelector(),
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
              _buildCategorySection(categoriesProvider),
              const Gap(24),
              _buildFoodPromoSection(
                textTheme,
                fooderProvider,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodPromoSection(
    TextTheme textTheme,
    FooderProvider homProvider,
  ) {
    return Column(
      children: [
        _promoHeader(textTheme),
        const Gap(8),
        _buildFoodPromo(homProvider),
      ],
    );
  }

  Widget _promoHeader(TextTheme textTheme) {
    return TextWithButtonRow(
      contentTitle: HomeStrings.kTodayPromoTxt,
      button: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FoodListScreen(
                categoryName: HomeStrings.kFoodListAppBarTitle,
              ),
            ),
          );
        },
        child: const Text(HomeStrings.kSeeAllTxt),
      ),
    );
  }

  Widget _buildFoodPromo(FooderProvider fooderProvider) {
    return Visibility(
      visible: fooderProvider.fooderList.isNotEmpty,
      replacement: const CenteredCircularProgressIndicator(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: fooderProvider.fooderList.map((fooder) {
            return FoodPromo(fooder: fooder);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategorySection(CategoriesProvider categoriesProvider) {
    return Visibility(
      visible: categoriesProvider.categoryList.isNotEmpty,
      replacement: const CenteredCircularProgressIndicator(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categoriesProvider.homeCategory().map(
            (CategoryModel category) {
              return FoodCategoryCard(
                category: category,
              );
            },
          ).toList(),
        ),
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
