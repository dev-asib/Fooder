import 'package:flutter/material.dart';
import 'package:fooder/core/constants/assets_paths/lotties_paths.dart';
import 'package:fooder/core/wrappers/lottie_viewer.dart';

class EmptyFoodWidget extends StatelessWidget {
  const EmptyFoodWidget({
    super.key,
    required this.emptyFoodMessage,
  });

  final String emptyFoodMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieViewer(lottiePath: LottiesPaths.kEmptyFoodLotties),
          Text(
            emptyFoodMessage,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
