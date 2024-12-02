import 'package:flutter/material.dart';
import 'package:fooder/features/home/presentations/screens/home_screen.dart';

class Fooder extends StatelessWidget {
  const Fooder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFFFFFFFF),
            foregroundColor: const Color(0xFFF44336),
          ),
        ),
      ),
    );
  }
}
