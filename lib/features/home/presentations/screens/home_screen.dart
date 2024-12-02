import 'package:flutter/material.dart';
import 'package:fooder/core/widgets/food.dart';
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
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Food(),
            FoodPromo(),
          ],
        ),
      ),
    );
  }
}
