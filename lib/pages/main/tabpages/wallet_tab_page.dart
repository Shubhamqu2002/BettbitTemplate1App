import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class WalletTabPage extends StatelessWidget {
  const WalletTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Wallet Tab Working',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}