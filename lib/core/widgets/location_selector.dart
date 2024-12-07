import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/location_model.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/centered_circular_progress_indicator.dart';
import 'package:fooder/features/common/providers/locations_provider.dart';
import 'package:provider/provider.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final locationsProvider = Provider.of<LocationsProvider>(context);

    if (locationsProvider.locationList.isEmpty) {
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
          iconEnabledColor: AppColors.kPrimaryColor,
          value: locationsProvider.selectedLocation,
          hint: Text(
            locationsProvider.selectedLocation!,
            style: textTheme.titleSmall,
          ),
          items: locationsProvider.locationList.map(
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
          onChanged: locationsProvider.onChangedLocation,
          isExpanded: false,
        ),
      ),
    );
  }
}
