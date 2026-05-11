import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameLiveInfoBanner extends StatelessWidget {
  const GameLiveInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -8),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(
          color: AppColors.bottomTabBackground,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: AppColors.cardBorder,
            width: 1,
          ),
        ),
        child: const Row(
          children: [
            _OnlineInfo(),
            Spacer(),
            _WinInfo(),
          ],
        ),
      ),
    );
  }
}

class _OnlineInfo extends StatelessWidget {
  const _OnlineInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.primaryGradientEnd,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          '99',
          style: TextStyle(
            color: AppColors.primaryGradientEnd,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          'players online',
          style: TextStyle(
            color: AppColors.bottomTabInactive,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _WinInfo extends StatelessWidget {
  const _WinInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.emoji_events_rounded,
          color: AppColors.jackpotYellow,
          size: 15,
        ),
        const SizedBox(width: 5),
        const Text(
          'Last win:',
          style: TextStyle(
            color: AppColors.bottomTabInactive,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          '\$8,119',
          style: TextStyle(
            color: AppColors.jackpotYellow,
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}