import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';
import 'components/payment_cashier_content.dart';
import 'components/payment_header.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          PaymentHeader(
            title: 'Payment',
          ),
          Expanded(
            child: PaymentCashierContent(),
          ),
        ],
      ),
    );
  }
}