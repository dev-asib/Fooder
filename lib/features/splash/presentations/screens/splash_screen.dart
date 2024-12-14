import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashProvider>(context, listen: false)
        .moveToBottomNavScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgViewer(
                svgAsset: IconsPaths.kAppLogoSvg,
                width: 180,
                height: 180,
              ),
              const Gap(8),
              Text(
                SplashStrings.kAppNameTxt,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: "BlackOpsOne",
                      color: AppColors.kPrimaryColor,
                    ),
              ),
              const Spacer(),
              const CircularProgressIndicator(),
              const Gap(16),
              Text(
                SplashStrings.kAppVersionTxt,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
