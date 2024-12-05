import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fooder/app.dart';
import 'package:fooder/features/common/providers/fooder_provider.dart';
import 'package:fooder/features/main_bottom_nav/providers/main_bottom_nav_provider.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainBottomNavProvider()),
          ChangeNotifierProvider(create: (_) => FooderProvider()),
        ],
        child: const Fooder(),
      ), // Wrap your app
    ),
  );
}
