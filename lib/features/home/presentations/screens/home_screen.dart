import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
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
      Provider.of<FoodProvider>(context, listen: false).loadFood(),
      Provider.of<LocationsProvider>(context, listen: false).loadLocations(),
      Provider.of<CategoriesProvider>(context, listen: false).loadCategories(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
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
              LocationSelector(homeProvider: homeProvider),
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
              _buildCategorySection(homeProvider),
              const Gap(24),
              _buildFoodPromoSection(
                textTheme,
                homeProvider,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodPromoSection(
    TextTheme textTheme,
    HomeProvider homeProvider,
  ) {
    return Column(
      children: [
        _promoHeader(textTheme),
        const Gap(8),
        _buildFoodPromo(homeProvider),
      ],
    );
  }

  Widget _promoHeader(TextTheme textTheme) {
    return TextWithButtonRow(
      contentTitle: HomeStrings.kTodayPromoTxt,
      button: TextButton(
        onPressed: _onTapSeeAllButton,
        child: const Text(HomeStrings.kSeeAllTxt),
      ),
    );
  }

  void _onTapSeeAllButton() {
    Navigator.of(context).pushNamed(
      RouteNames.foodListScreen,
      arguments: HomeStrings.kFoodListAppBarTitle,
    );
  }

  Widget _buildFoodPromo(HomeProvider homeProvider) {
    return Visibility(
      visible: homeProvider.homePromoFoodList.isNotEmpty,
      replacement: const CenteredCircularProgressIndicator(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: homeProvider.homePromoFoodList.map((food) {
            return FoodPromo(food: food);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategorySection(HomeProvider homeProvider) {
    return Visibility(
      visible: homeProvider.homeCategoryList.isNotEmpty,
      replacement: const CenteredCircularProgressIndicator(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: homeProvider.homeCategoryList.map(
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
