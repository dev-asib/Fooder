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
      Provider.of<FoodProvider>(context, listen: false).loadFoodData(),
      Provider.of<LocationsProvider>(context, listen: false).locationsData(),
      Provider.of<CategoriesProvider>(context, listen: false)
          .loadCategoryData(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final fooderProvider = Provider.of<FoodProvider>(context);
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
    FoodProvider homProvider,
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

  Widget _buildFoodPromo(FoodProvider fooderProvider) {
    return Visibility(
      visible: fooderProvider.foodList.isNotEmpty,
      replacement: const CenteredCircularProgressIndicator(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: fooderProvider.foodList.map((fooder) {
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
