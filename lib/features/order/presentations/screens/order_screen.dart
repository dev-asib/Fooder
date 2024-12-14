import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.kScreenAllPadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDeliveryImageView(),
                Text(
                  OrderStrings.kOrderConfirmedTxt,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                const Gap(16),
                Text(
                  OrderStrings.kOrderConfirmMsgTxt,
                  textAlign: TextAlign.center,
                  style: textTheme.titleSmall,
                ),
                const Gap(32),
                _buildConfirmOrderButton(
                  textTheme,
                  context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmOrderButton(
    TextTheme textTheme,
    BuildContext context,
  ) {
    return CustomButton(
      borderRadius: 12,
      width: 300,
      height: 56,
      widgets: [
        Text(
          OrderStrings.kOrderBtnTxt,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.kWhiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
      onPressed: () => _onTapOrderConfirmButton(context),
    );
  }

  void _onTapOrderConfirmButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainBottomNavScreen(),
      ),
    );
    Provider.of<MainBottomNavProvider>(context, listen: false).backToHome();
    AlertMessage.showFlushBarMessage(
      context: context,
      message: OrderStrings.kOrderConfirmationMessage,
    );
  }

  Widget _buildDeliveryImageView() {
    return SvgViewer(
      svgAsset: ImagesPaths.kFoodDeliverySvg,
      width: 250,
      height: 250,
    );
  }
}
