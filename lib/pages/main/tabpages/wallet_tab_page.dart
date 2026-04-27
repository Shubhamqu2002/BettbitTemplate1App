import 'package:flutter/material.dart';
import '../wallettabcomponent/bonus_balance_card.dart';
import '../wallettabcomponent/financial_summary_card.dart';
import '../wallettabcomponent/real_money_balance_card.dart';
import '../wallettabcomponent/transaction_history_card.dart';

class WalletTabPage extends StatelessWidget {
  const WalletTabPage({super.key});

  static const double _sectionGap = 14;
  static const double _topPadding = 6;

  @override
  Widget build(BuildContext context) {
    final bottomSpacing = MediaQuery.sizeOf(context).height * 0.08;

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView(
        padding: EdgeInsets.only(
          top: _topPadding,
          bottom: bottomSpacing,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          RealMoneyBalanceCard(
            balance: '\$1,250.75',
            onWithdrawTap: () {},
          ),
          const SizedBox(height: _sectionGap),
          BonusBalanceCard(
            balance: '\$50.00',
            onDepositTap: () {},
          ),
          const SizedBox(height: _sectionGap),
          const FinancialSummaryCard(),
          const SizedBox(height: _sectionGap),
          const TransactionHistoryCard(),
          const SizedBox(height: _sectionGap),
        ],
      ),
    );
  }
}