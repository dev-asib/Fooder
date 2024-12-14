import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class Fooder extends StatefulWidget {
  const Fooder({super.key});

  @override
  State<Fooder> createState() => _FooderState();
}

class _FooderState extends State<Fooder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: AppThemes.appTheme(),
    );
  }
}
