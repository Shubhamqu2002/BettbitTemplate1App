import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';
import 'my_bets_search_bar.dart';

class BetRecordsLedgerSection extends StatefulWidget {
  const BetRecordsLedgerSection({super.key});

  @override
  State<BetRecordsLedgerSection> createState() =>
      _BetRecordsLedgerSectionState();
}

class _BetRecordsLedgerSectionState extends State<BetRecordsLedgerSection> {
  int? expandedIndex;

  final List<_BetRecordModel> records = const [
    _BetRecordModel(
      gameName: 'Book of Night',
      provider: 'PRAGMATIC PLAY',
      dateTime: '2025-01-18  14:32:15',
      status: 'Win',
      amount: '+\$50.00',
      transactionId: 'TXN-2025-001234',
      roundId: 'RND-567890',
      betId: 'BET-112233',
      multiplier: '2.5x',
      balanceBefore: '\$250.00',
      balanceAfter: '\$300.00',
      isWin: true,
    ),
    _BetRecordModel(
      gameName: 'Book of Night',
      provider: 'PRAGMATIC PLAY',
      dateTime: '2025-01-18  14:31:02',
      status: 'Win',
      amount: '+\$50.00',
      transactionId: 'TXN-2025-001235',
      roundId: 'RND-567891',
      betId: 'BET-112234',
      multiplier: '2.5x',
      balanceBefore: '\$200.00',
      balanceAfter: '\$250.00',
      isWin: true,
    ),
    _BetRecordModel(
      gameName: 'Book of Night',
      provider: 'PRAGMATIC PLAY',
      dateTime: '2025-01-18  14:28:45',
      status: 'Loss',
      amount: '-\$50.00',
      transactionId: 'TXN-2025-001236',
      roundId: 'RND-567892',
      betId: 'BET-112235',
      multiplier: '0x',
      balanceBefore: '\$250.00',
      balanceAfter: '\$200.00',
      isWin: false,
    ),
    _BetRecordModel(
      gameName: 'Book of Night',
      provider: 'PRAGMATIC PLAY',
      dateTime: '2025-01-18  14:25:10',
      status: 'Win',
      amount: '+\$50.00',
      transactionId: 'TXN-2025-001237',
      roundId: 'RND-567893',
      betId: 'BET-112236',
      multiplier: '2.5x',
      balanceBefore: '\$150.00',
      balanceAfter: '\$200.00',
      isWin: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -2),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bet Records Ledger',
              style: TextStyle(
                color: AppColors.primaryGradientEnd,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Complete transparency on every bet placed',
              style: TextStyle(
                color: AppColors.bottomTabInactive,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 18),
            const MyBetsSearchBar(),
            const SizedBox(height: 22),
            Column(
              children: [
                for (int i = 0; i < records.length; i++) ...[
                  _BetRecordTile(
                    record: records[i],
                    isExpanded: expandedIndex == i,
                    onTap: () {
                      setState(() {
                        expandedIndex = expandedIndex == i ? null : i;
                      });
                    },
                  ),
                  if (i != records.length - 1 && expandedIndex != i)
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.transactionDivider,
                    ),
                ],
              ],
            ),
            const SizedBox(height: 18),
            const _ViewMoreButton(),
          ],
        ),
      ),
    );
  }
}

class _BetRecordTile extends StatelessWidget {
  final _BetRecordModel record;
  final bool isExpanded;
  final VoidCallback onTap;

  const _BetRecordTile({
    required this.record,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return _ExpandedBetCard(
        record: record,
        onTap: onTap,
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 14, 8, 15),
        child: Row(
          children: [
            _GameIconBox(isExpanded: false),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.gameName,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    record.provider,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.7,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    record.dateTime,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _StatusBadge(
                  text: record.status,
                  isWin: record.isWin,
                ),
                const SizedBox(height: 30),
                Text(
                  record.amount,
                  style: TextStyle(
                    color: record.isWin
                        ? AppColors.withdrawButtonBackground
                        : AppColors.bannerHotTag,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
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

class _ExpandedBetCard extends StatelessWidget {
  final _BetRecordModel record;
  final VoidCallback onTap;

  const _ExpandedBetCard({
    required this.record,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.walletCardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.35),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Column(
          children: [
            Row(
              children: [
                _GameIconBox(isExpanded: true),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        record.gameName,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        record.provider,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.7,
                        ),
                      ),
                    ],
                  ),
                ),
                _StatusBadge(
                  text: record.status,
                  isWin: record.isWin,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: AppColors.bottomTabInactive,
                  size: 22,
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Text(
                    record.dateTime,
                    style: const TextStyle(
                      color: AppColors.bottomTabInactive,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  record.amount,
                  style: TextStyle(
                    color: record.isWin
                        ? AppColors.withdrawButtonBackground
                        : AppColors.bannerHotTag,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.transactionDivider,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _InfoTextBlock(
                    label: 'TRANSACTION ID',
                    value: record.transactionId,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _InfoTextBlock(
                    label: 'ROUND ID',
                    value: record.roundId,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _InfoTextBlock(
                    label: 'BET ID',
                    value: record.betId,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _InfoTextBlock(
                    label: 'MULTIPLIER',
                    value: record.multiplier,
                    valueColor: AppColors.primaryGradientEnd,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Transform.translate(
              offset: const Offset(-2, 0),
              child: Row(
                children: [
                  Expanded(
                    child: _BalanceCard(
                      label: 'BALANCE BEFORE',
                      value: record.balanceBefore,
                      valueColor: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _BalanceCard(
                      label: 'BALANCE AFTER',
                      value: record.balanceAfter,
                      valueColor: AppColors.withdrawButtonBackground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameIconBox extends StatelessWidget {
  final bool isExpanded;

  const _GameIconBox({required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? 48 : 41,
      height: isExpanded ? 48 : 41,
      decoration: BoxDecoration(
        color: AppColors.searchGradientStart.withOpacity(0.18),
        borderRadius: BorderRadius.circular(isExpanded ? 11 : 9),
        border: Border.all(
          color: AppColors.searchGradientStart.withOpacity(0.30),
          width: 1,
        ),
      ),
      child: const Icon(
        Icons.casino_rounded,
        color: AppColors.bottomTabInactive,
        size: 21,
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String text;
  final bool isWin;

  const _StatusBadge({
    required this.text,
    required this.isWin,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        isWin ? AppColors.primaryGradientEnd : AppColors.bannerHotTag;

    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.45),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _InfoTextBlock extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoTextBlock({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: valueColor ?? AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _BalanceCard({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.fromLTRB(12, 11, 12, 10),
      decoration: BoxDecoration(
        color: AppColors.toggleBg,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: AppColors.transactionDivider,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.7,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewMoreButton extends StatelessWidget {
  const _ViewMoreButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.walletCardBackground,
          side: const BorderSide(
            color: AppColors.walletCardBorder,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'View More History',
          style: TextStyle(
            color: AppColors.primaryGradientEnd,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _BetRecordModel {
  final String gameName;
  final String provider;
  final String dateTime;
  final String status;
  final String amount;
  final String transactionId;
  final String roundId;
  final String betId;
  final String multiplier;
  final String balanceBefore;
  final String balanceAfter;
  final bool isWin;

  const _BetRecordModel({
    required this.gameName,
    required this.provider,
    required this.dateTime,
    required this.status,
    required this.amount,
    required this.transactionId,
    required this.roundId,
    required this.betId,
    required this.multiplier,
    required this.balanceBefore,
    required this.balanceAfter,
    required this.isWin,
  });
}