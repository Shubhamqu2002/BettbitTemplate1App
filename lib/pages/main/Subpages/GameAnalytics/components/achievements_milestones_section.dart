import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class AchievementsMilestonesSection extends StatelessWidget {
  const AchievementsMilestonesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 18, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ACHIEVEMENTS & MILESTONES',
            style: TextStyle(
              color: AppColors.jackpotYellow,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
              height: 1.1,
            ),
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _AchievementCard(
                  title: 'First Win',
                  subtitle: 'Win your first game',
                  icon: Icons.emoji_events_rounded,
                  isUnlocked: true,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _AchievementCard(
                  title: 'High Roller',
                  subtitle: 'Bet over \$1000 total',
                  icon: Icons.workspace_premium_rounded,
                  isUnlocked: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _AchievementCard(
                  title: 'Jackpot King',
                  subtitle: 'Hit a jackpot',
                  icon: Icons.lock_rounded,
                  isUnlocked: false,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _AchievementCard(
                  title: 'Daily Streak',
                  subtitle: 'Play 7 days in a row',
                  icon: Icons.lock_rounded,
                  isUnlocked: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isUnlocked;

  const _AchievementCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      decoration: BoxDecoration(
        color: isUnlocked
            ? AppColors.walletCardBackground
            : AppColors.cardBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _AchievementIcon(
            icon: icon,
            isUnlocked: isUnlocked,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isUnlocked
                  ? AppColors.textPrimary
                  : AppColors.bottomTabInactive,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.bottomTabInactive.withOpacity(
                isUnlocked ? 1 : 0.85,
              ),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementIcon extends StatelessWidget {
  final IconData icon;
  final bool isUnlocked;

  const _AchievementIcon({
    required this.icon,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isUnlocked
            ? AppColors.searchGradientStart.withOpacity(0.22)
            : AppColors.bottomTabInactive.withOpacity(0.16),
      ),
      child: Center(
        child: Icon(
          icon,
          color: isUnlocked
              ? AppColors.searchGradientStart
              : AppColors.bottomTabInactive,
          size: 24,
        ),
      ),
    );
  }
}