import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameDetailsSection extends StatelessWidget {
  final String title;
  final String provider;

  const GameDetailsSection({
    super.key,
    required this.title,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -10),
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                const Text(
                  'Developed By',
                  style: TextStyle(
                    color: AppColors.bottomTabInactive,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    provider,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.primaryGradientEnd,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryGradientEnd,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                ...List.generate(
                  5,
                  (_) => const Padding(
                    padding: EdgeInsets.only(right: 1.5),
                    child: Icon(
                      Icons.star_rounded,
                      color: AppColors.jackpotYellow,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '5/5',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '(8,126)',
                  style: TextStyle(
                    color: AppColors.textHint,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _GameTag(
                  icon: Icons.local_fire_department_rounded,
                  title: 'Trending',
                  textColor: Color(0xFFFF6B6B),
                  borderColor: Color(0x99FF4D4F),
                  backgroundColor: Color(0x33FF4D4F),
                ),
                _GameTag(
                  icon: Icons.emoji_events_rounded,
                  title: 'Jackpot',
                  textColor: AppColors.jackpotYellow,
                  borderColor: Color(0x99FFC700),
                  backgroundColor: Color(0x26FFC700),
                ),
                _GameTag(
                  icon: Icons.bolt_rounded,
                  title: 'High Volatility',
                  textColor: Color(0xFF28E878),
                  borderColor: Color(0x9900E676),
                  backgroundColor: Color(0x2600E676),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GameTag extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;

  const _GameTag({
    required this.icon,
    required this.title,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: textColor,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}