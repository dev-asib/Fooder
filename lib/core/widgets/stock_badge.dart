import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  const StockBadge({
    super.key,
    required this.stockCount,
  });

  final int stockCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFEDA345),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        "$stockCount Left",
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
