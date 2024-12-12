import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class StockBadge extends StatelessWidget {
  const StockBadge({
    super.key,
    required this.stockCount,
  });

  final int stockCount;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFEDA345),
        border: Border.all(
          color: AppColors.kWhiteColor,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 3.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        "$stockCount Left",
        style: textTheme.bodySmall,
      ),
    );
  }
}
