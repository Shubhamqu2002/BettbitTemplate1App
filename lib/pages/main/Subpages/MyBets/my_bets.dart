import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';
import '../ScreenHeader/screen_header.dart';
import 'components/my_bets_stats_overview.dart';
import 'components/bet_records_ledger_section.dart';

class MyBetsPage extends StatelessWidget {
  const MyBetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ScreenHeader(
            title: 'My Bets',
            balance: '\$1566',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(bottom: 28),
                child: Column(
                  children: [
                    MyBetsStatsOverview(),
                    BetRecordsLedgerSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}