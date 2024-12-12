import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
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
