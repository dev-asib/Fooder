import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/features/common/providers/fooder_provider.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({
    super.key,
    required this.homeProvider,
  });

  final FooderProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kFadedPinkColor,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButton<String>(
          iconEnabledColor: AppColors.kPrimaryColor,
          value: homeProvider.selectedLocation,
          hint: Text(
            homeProvider.locations.first,
            style: textTheme.titleSmall,
          ),
          items: homeProvider.locations.map(
            (String loc) {
              return DropdownMenuItem(
                value: loc,
                child: Text(
                  loc,
                  style: textTheme.titleSmall,
                ),
              );
            },
          ).toList(),
          onChanged: homeProvider.onChangedLocation,
          isExpanded: false,
        ),
      ),
    );
  }
}
