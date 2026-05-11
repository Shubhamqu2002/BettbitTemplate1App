import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameHighlightsSection extends StatelessWidget {
  const GameHighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Column(
        children: [
          _HighlightCard(
            title: 'BEST PERFORMANCE',
            rank: '#1',
            gameName: 'Mystic Fortune',
            label: 'Net Result',
            amount: '+\$450',
            footer: 'TOTAL NET WINNINGS',
            glowAlignment: Alignment.topRight,
            glowColor: AppColors.searchModalInputBorder,
          ),
          SizedBox(height: 16),
          _HighlightCard(
            title: 'BIGGEST SINGLE WIN',
            rank: '#1',
            gameName: 'Golden Temple',
            label: 'Net Result',
            amount: '\$1,250',
            footer: 'ON OCTOBER 5, 2024',
            glowAlignment: Alignment.topLeft,
            glowColor: AppColors.jackpotYellow,
          ),
        ],
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final String title;
  final String rank;
  final String gameName;
  final String label;
  final String amount;
  final String footer;
  final Alignment glowAlignment;
  final Color glowColor;

  const _HighlightCard({
    required this.title,
    required this.rank,
    required this.gameName,
    required this.label,
    required this.amount,
    required this.footer,
    required this.glowAlignment,
    required this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.walletCardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: glowAlignment,
                  radius: 0.75,
                  colors: [
                    glowColor.withOpacity(0.22),
                    glowColor.withOpacity(0.07),
                    AppColors.walletCardBackground.withOpacity(0),
                  ],
                  stops: const [0.0, 0.42, 1.0],
                ),
              ),
            ),
          ),

          /// ✅ Everything centered in the card
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.jackpotYellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 18),
                  _RankBox(rank: rank),
                  const SizedBox(height: 18),
                  Text(
                    gameName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.bottomTabInactive,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 17),
                  Text(
                    amount,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.withdrawButtonBackground,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    footer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.bottomTabInactive,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RankBox extends StatelessWidget {
  final String rank;

  const _RankBox({required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41,
      height: 39,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.trophyBackground,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.trophyBorder,
          width: 1,
        ),
      ),
      child: Text(
        rank,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.jackpotYellow,
          fontSize: 14,
          fontWeight: FontWeight.w800,
          height: 1,
        ),
      ),
    );
  }
}