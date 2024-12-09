import 'package:flutter/material.dart';
import 'package:fooder/core/constants/assets_paths/icons_paths.dart';
import 'package:fooder/core/wrappers/svg_viewer.dart';
import 'package:fooder/features/checkout/utilites/checkout_strings/check_out_strings.dart';
import 'package:gap/gap.dart';

class FoodDeliveryLocationSection extends StatelessWidget {
  const FoodDeliveryLocationSection({
    super.key,
    required this.deliveryAddressFormKey,
    required this.deliveryAddressTEController,
  });

  final GlobalKey<FormState> deliveryAddressFormKey;
  final TextEditingController deliveryAddressTEController;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CheckoutStrings.kDeliveryToTxt,
                      style: textTheme.titleSmall,
                    ),
                    const Gap(8),
                    Text(
                      "JI. Jayakatwang no 301",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Spacer(),
                SvgViewer(
                  svgAsset: IconsPaths.kLocationSvg,
                  height: 35,
                  width: 35,
                ),
              ],
            ),
            const Gap(16),
            Form(
              key: deliveryAddressFormKey,
              child: TextFormField(
                controller: deliveryAddressTEController,
                decoration: InputDecoration(
                  hintText: CheckoutStrings.kDeliveryAddressHintTxt,
                  prefixIcon: SvgViewer(svgAsset: IconsPaths.kAddressTextSvg),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
