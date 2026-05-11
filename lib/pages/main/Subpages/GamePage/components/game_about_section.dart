import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameAboutSection extends StatelessWidget {
  const GameAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -14),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          border: Border(
            top: BorderSide(
              color: AppColors.cardBorder,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 22),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About This Game',
              style: TextStyle(
                color: AppColors.jackpotYellow,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Embark on an epic adventure in this mystical slot where ancient gods and legendary treasures await. With stunning graphics and immersive gameplay, every spin brings the possibility of discovering untold riches.',
              style: TextStyle(
                color: AppColors.bottomTabInactive,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.55,
              ),
            ),
            SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _AboutColumn(
                    icon: Icons.flash_on_rounded,
                    iconColor: AppColors.jackpotYellow,
                    title: 'Special Features',
                    items: [
                      'Wild Multipliers',
                      'Expanding Symbols',
                      'Bonus Wheel Mini-game',
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _AboutColumn(
                    icon: Icons.card_giftcard_rounded,
                    iconColor: AppColors.primaryGradientEnd,
                    title: 'Bonus Rounds',
                    items: [
                      'Temple of Fortune',
                      'Divine Free Spins',
                      'God’s Blessing',
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutColumn extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final List<String> items;

  const _AboutColumn({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 15),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              '• $item',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.bottomTabInactive,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}