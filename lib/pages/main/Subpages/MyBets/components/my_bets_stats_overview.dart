import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class MyBetsStatsOverview extends StatelessWidget {
  const MyBetsStatsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -6),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(12, 16, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _StatsCard(
                    title: 'Total Bets',
                    value: '05',
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: _StatsCard(
                    title: 'Total Won',
                    value: '\$260.50',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            _StatsCard(
              title: 'Net Result',
              value: '\$230.50',
              badgeText: '+12%',
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String? badgeText;

  const _StatsCard({
    required this.title,
    required this.value,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 13),
      decoration: BoxDecoration(
        color: AppColors.walletCardBackground,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.18),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.bottomTabInactive,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 13),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.primaryGradientEnd,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  height: 1,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
          if (badgeText != null)
            Positioned(
              top: -2,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.withdrawButtonBackground.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.withdrawButtonBackground.withOpacity(0.28),
                    width: 1,
                  ),
                ),
                child: Text(
                  badgeText!,
                  style: const TextStyle(
                    color: AppColors.withdrawButtonBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}