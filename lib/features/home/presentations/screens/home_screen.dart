import 'package:flutter/material.dart';
import 'package:fooder/core/widgets/food_card_tile.dart';
import 'package:fooder/core/widgets/food_promo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          FoodCardTile(
            titleText: "Fruit Salad Mix",
            descriptionText: "Delics Fruit Salad Ngasem",
            originalPrice: 600,
            discountPrice: 500,
            stockCount: 5,
            totalFoodCount: 10,
          ),
          FoodPromo(),
        ],
      ),
      appBar: AppBar(
        title: const Text("Home"),
      ),
    );
  }
}
