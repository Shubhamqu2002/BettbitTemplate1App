import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class ProgressiveJackpotCard extends StatelessWidget {
  final String title;
  final String amount;
  final String subtitle;
  final VoidCallback? onTap;

  const ProgressiveJackpotCard({
    super.key,
    this.title = 'Progressive Jackpot',
    this.amount = '\$8,547,368',
    this.subtitle = 'Updates every 3 seconds',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 4, 18, 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: BoxDecoration(
              color: AppColors.bottomTabBackground,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.jackpotCardBorder,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.jackpotYellow.withOpacity(0.16),
                  blurRadius: 18,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: AppColors.jackpotYellow,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          amount,
                          style: const TextStyle(
                            color: AppColors.jackpotYellow,
                            fontSize: 40,
                            height: 1,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: AppColors.bottomTabInactive,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: AppColors.jackpotYellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.monetization_on_rounded,
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}