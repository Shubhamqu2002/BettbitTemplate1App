import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class ProfileStatsGrid extends StatelessWidget {
  const ProfileStatsGrid({super.key});

  static const double _cardGap = 14;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _ProfileStatCard(
                  icon: Icons.monetization_on_rounded,
                  iconColor: AppColors.jackpotYellow,
                  iconBgColor: Color(0x33FFC700),
                  title: 'Lifetime Winnings',
                  value: '\$2,450.50',
                  valueColor: AppColors.jackpotYellow,
                  badgeText: '+12%',
                ),
              ),
              SizedBox(width: _cardGap),
              Expanded(
                child: _ProfileStatCard(
                  icon: Icons.percent_rounded,
                  iconColor: AppColors.primaryGradientStart,
                  iconBgColor: Color(0x33BD44FF),
                  title: 'Win/Loss Ratio',
                  value: '62%',
                  valueColor: AppColors.primaryGradientStart,
                ),
              ),
            ],
          ),
          SizedBox(height: _cardGap),
          Row(
            children: [
              Expanded(
                child: _ProfileStatCard(
                  icon: Icons.favorite_rounded,
                  iconColor: Color(0xFF3B82F6),
                  iconBgColor: Color(0x333B82F6),
                  title: 'Favorite Game',
                  value: 'Mystic Fortune',
                  valueFontSize: 15,
                  valueColor: AppColors.white,
                ),
              ),
              SizedBox(width: _cardGap),
              Expanded(
                child: _ProfileStatCard(
                  icon: Icons.hourglass_bottom_rounded,
                  iconColor: AppColors.vipGradientEnd,
                  iconBgColor: Color(0x33FF9500),
                  title: 'Total Playtime',
                  value: '127 h',
                  valueColor: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileStatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String value;
  final Color valueColor;
  final String? badgeText;
  final double valueFontSize;

  const _ProfileStatCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.value,
    required this.valueColor,
    this.badgeText,
    this.valueFontSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.walletCardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          /// 🔥 Growth Badge
          if (badgeText != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.withdrawButtonBackground.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badgeText!,
                  style: const TextStyle(
                    color: AppColors.withdrawButtonBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Icon
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),

              const Spacer(),

              /// 🔹 Title
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.bottomTabInactive,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              /// 🔹 Value (MAIN FIX HERE)
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: valueColor,
                  fontSize: valueFontSize,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}