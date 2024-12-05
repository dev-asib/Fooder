import 'package:flutter/material.dart';
import 'package:fooder/app.dart';
import 'package:fooder/features/home/providers/home_provider.dart';
import 'package:fooder/features/main_bottom_nav/providers/main_bottom_nav_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainBottomNavProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const Fooder(),
    ),
  );
}
