import 'package:flutter/material.dart';

class EmptyFood extends StatelessWidget {
  const EmptyFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Items found",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
