import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';

class PaymentAmountSelectionCard extends StatelessWidget {
  final String title;
  final int selectedAmount;
  final List<int> amounts;
  final ValueChanged<int> onAmountChanged;

  const PaymentAmountSelectionCard({
    super.key,
    required this.title,
    required this.selectedAmount,
    required this.amounts,
    required this.onAmountChanged,
  });

  String _formatAmount(int amount) {
    if (amount >= 1000) {
      return '${amount ~/ 1000}k';
    }
    return amount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 32, 12, 32),
      decoration: BoxDecoration(
        color: const Color(0xFF080B12),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.inputBorder,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),

          Container(
            height: 58,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            decoration: BoxDecoration(
              color: const Color(0xFF02070C),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.inputBorder,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                const Text(
                  '₹',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      selectedAmount.toString(),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.trending_up_rounded,
                    color: Colors.greenAccent,
                    size: 17,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 34),

          const Center(
            child: Text(
              'QUICK SELECT',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: amounts.map((amount) {
              final isSelected = selectedAmount == amount;

              return GestureDetector(
                onTap: () => onAmountChanged(amount),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    gradient: isSelected ? AppColors.primaryGradient : null,
                    color: isSelected ? null : const Color(0xFF101B26),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Text(
                    _formatAmount(amount),
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.white
                          : AppColors.textSecondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}