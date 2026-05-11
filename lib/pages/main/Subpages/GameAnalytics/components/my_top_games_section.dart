import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class MyTopGamesSection extends StatelessWidget {
  const MyTopGamesSection({super.key});

  static const List<_TopGameModel> _games = [
    _TopGameModel(
      rank: 1,
      title: 'Mystic Fortune',
      playtime: '45h',
      totalBet: '\$2,500',
      netResult: '+\$450',
    ),
    _TopGameModel(
      rank: 2,
      title: "Dragon's Treasure",
      playtime: '32h',
      totalBet: '\$1,800',
      netResult: '+\$320',
    ),
    _TopGameModel(
      rank: 3,
      title: 'Golden Temple',
      playtime: '28h',
      totalBet: '\$2,100',
      netResult: '+\$150',
    ),
    _TopGameModel(
      rank: 4,
      title: 'Wild Safari',
      playtime: '15h',
      totalBet: '\$950',
      netResult: '+\$80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
      child: Column(
        children: [
          const _SectionHeader(),
          const SizedBox(height: 14),
          ...List.generate(
            _games.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == _games.length - 1 ? 0 : 12,
              ),
              child: _TopGameCard(game: _games[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'MY TOP GAMES',
            style: TextStyle(
              color: AppColors.jackpotYellow,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
              height: 1.1,
            ),
          ),
        ),
        Text(
          'Last 30 Days',
          style: TextStyle(
            color: AppColors.bottomTabInactive,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}

class _TopGameCard extends StatelessWidget {
  final _TopGameModel game;

  const _TopGameCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.walletCardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.30),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
        child: Column(
          children: [
            Row(
              children: [
                _RankBadge(rank: game.rank),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    game.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.transactionDivider,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _GameStatItem(
                    label: 'PLAYTIME',
                    value: game.playtime,
                  ),
                ),
                const _VerticalDividerLine(),
                Expanded(
                  child: _GameStatItem(
                    label: 'TOTAL BET',
                    value: game.totalBet,
                  ),
                ),
                const _VerticalDividerLine(),
                Expanded(
                  child: _GameStatItem(
                    label: 'NET RESULT',
                    value: game.netResult,
                    valueColor: AppColors.withdrawButtonBackground,
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

class _RankBadge extends StatelessWidget {
  final int rank;

  const _RankBadge({required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 33,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.trophyBackground,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.trophyBorder,
          width: 1,
        ),
      ),
      child: Text(
        '#$rank',
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

class _GameStatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _GameStatItem({
    required this.label,
    required this.value,
    this.valueColor = AppColors.textPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.bottomTabInactive,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: valueColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}

class _VerticalDividerLine extends StatelessWidget {
  const _VerticalDividerLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 36,
      color: AppColors.transactionDivider,
    );
  }
}

class _TopGameModel {
  final int rank;
  final String title;
  final String playtime;
  final String totalBet;
  final String netResult;

  const _TopGameModel({
    required this.rank,
    required this.title,
    required this.playtime,
    required this.totalBet,
    required this.netResult,
  });
}