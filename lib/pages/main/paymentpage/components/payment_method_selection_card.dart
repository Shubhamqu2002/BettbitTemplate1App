import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';

class PaymentMethodSelectionCard extends StatelessWidget {
  final bool isDeposit;
  final int selectedAmount;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const PaymentMethodSelectionCard({
    super.key,
    required this.isDeposit,
    required this.selectedAmount,
    required this.selectedIndex,
    required this.onSelected,
  });

  static List<PaymentMethodModel> getMethods(bool isDeposit) {
    if (isDeposit) {
      return const [
        PaymentMethodModel(
          keyName: 'upi',
          title: 'UPI',
          subtitle: 'GPay, PhonePe, Paytm & more',
          iconText: 'UPI',
          badge: 'INSTANT',
          badgeColor: Color(0xFFFF7A00),
          iconColors: [Color(0xFF7C3AED), Color(0xFF9333EA)],
        ),
        PaymentMethodModel(
          keyName: 'card',
          title: 'Credit / Debit Card',
          subtitle: 'Visa, Mastercard, RuPay cards',
          icon: Icons.credit_card_rounded,
          iconColors: [Color(0xFF1E3A8A), Color(0xFF312E81)],
        ),
        PaymentMethodModel(
          keyName: 'net_banking',
          title: 'Net Banking',
          subtitle: 'All major banks supported',
          icon: Icons.account_balance_rounded,
          iconColors: [Color(0xFF0284C7), Color(0xFF0891B2)],
        ),
        PaymentMethodModel(
          keyName: 'razorpay',
          title: 'Razorpay',
          subtitle: 'Fast & secure Indian payments',
          iconText: 'r/',
          badge: 'POPULAR',
          badgeColor: Color(0xFF00E676),
          iconColors: [Color(0xFF020617), Color(0xFF172554)],
        ),
        PaymentMethodModel(
          keyName: 'cash',
          title: 'Cash',
          subtitle: 'Deposit using cash payment',
          icon: Icons.payments_rounded,
          iconColors: [Color(0xFF16A34A), Color(0xFF15803D)],
        ),
        PaymentMethodModel(
          keyName: 'stripe',
          title: 'Stripe',
          subtitle: 'International card payments',
          iconText: 'S',
          iconColors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
        ),
      ];
    }

    return const [
      PaymentMethodModel(
        keyName: 'bank_transfer',
        title: 'Bank Transfer',
        subtitle: 'Withdraw directly to your bank',
        icon: Icons.account_balance_rounded,
        badge: 'SAFE',
        badgeColor: Color(0xFF00E676),
        iconColors: [Color(0xFF0284C7), Color(0xFF0369A1)],
      ),
      PaymentMethodModel(
        keyName: 'upi_withdraw',
        title: 'UPI',
        subtitle: 'Withdraw to your UPI ID instantly',
        iconText: 'UPI',
        badge: 'INSTANT',
        badgeColor: Color(0xFFFF7A00),
        iconColors: [Color(0xFF7C3AED), Color(0xFF9333EA)],
      ),
      PaymentMethodModel(
        keyName: 'paypal_withdraw',
        title: 'PayPal',
        subtitle: 'Withdraw to PayPal account',
        iconText: 'P',
        iconColors: [Color(0xFF1D4ED8), Color(0xFF2563EB)],
      ),
      PaymentMethodModel(
        keyName: 'stripe_withdraw',
        title: 'Stripe',
        subtitle: 'Withdraw via Stripe payout',
        iconText: 'S',
        iconColors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethods = getMethods(isDeposit);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Payment Method',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          isDeposit
              ? 'Select your preferred way to deposit ₹$selectedAmount'
              : 'Select your preferred way to withdraw ₹$selectedAmount',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 18),

        ...List.generate(paymentMethods.length, (index) {
          final item = paymentMethods[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _PaymentMethodTile(
              item: item,
              isSelected: isSelected,
              onTap: () => onSelected(index),
            ),
          );
        }),
      ],
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final PaymentMethodModel item;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodTile({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        decoration: BoxDecoration(
          color: const Color(0xFF070807),
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryGradientEnd.withOpacity(0.85)
                : AppColors.inputBorder.withOpacity(0.75),
            width: isSelected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: item.iconColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: item.iconText != null
                    ? Text(
                        item.iconText!,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    : Icon(item.icon, color: AppColors.white, size: 22),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryGradientEnd
                      : AppColors.textSecondary.withOpacity(0.45),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryGradientEnd,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodModel {
  final String keyName;
  final String title;
  final String subtitle;
  final IconData? icon;
  final String? iconText;
  final String? badge;
  final Color badgeColor;
  final List<Color> iconColors;

  const PaymentMethodModel({
    required this.keyName,
    required this.title,
    required this.subtitle,
    this.icon,
    this.iconText,
    this.badge,
    this.badgeColor = Colors.greenAccent,
    required this.iconColors,
  });
}