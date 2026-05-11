import 'package:flutter/material.dart';
import '../config/colors/app_colors.dart';

class HeaderBalanceButton extends StatelessWidget {
  final String balance;
  final VoidCallback? onTap;

  const HeaderBalanceButton({
    super.key,
    this.balance = '\$1566',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      padding: const EdgeInsets.only(left: 13, right: 8),
      decoration: BoxDecoration(
        color: AppColors.bottomTabBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.jackpotYellow,
          width: 1.2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                balance,
                style: const TextStyle(
                  color: AppColors.jackpotYellow,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: AppColors.jackpotYellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: AppColors.background,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}