import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({
    super.key,
    required this.homeProvider,
  });

  final HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (homeProvider.homeLocationList.isEmpty) {
      return const CenteredCircularProgressIndicator();
    }

    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kFadedPinkColor,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButton<String>(
          underline: const SizedBox.shrink(),
          iconEnabledColor: AppColors.kPrimaryColor,
          value: homeProvider.selectedLocation,
          hint: Text(
            homeProvider.selectedLocation!,
            style: textTheme.titleSmall,
          ),
          items: homeProvider.homeLocationList.map(
            (LocationModel loc) {
              return DropdownMenuItem(
                value: loc.address,
                child: Text(
                  loc.address!,
                  style: textTheme.titleSmall,
                ),
              );
            },
          ).toList(),
          onChanged: homeProvider.onChangedHomeLocation,
          isExpanded: false,
        ),
      ),
    );
  }
}
