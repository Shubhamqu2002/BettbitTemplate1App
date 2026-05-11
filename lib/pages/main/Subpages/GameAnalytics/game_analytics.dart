import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';
import '../ScreenHeader/screen_header.dart';
import 'components/my_top_games_section.dart';
import 'components/game_type_distribution_chart.dart';
import 'components/game_highlights_section.dart';
import 'components/achievements_milestones_section.dart';

class GameAnalyticsPage extends StatelessWidget {
  const GameAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ScreenHeader(
            title: 'Game Analytics',
            balance: '\$1566',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(bottom: 28),
                child: Column(
                  children: [
                    MyTopGamesSection(),
                    GameTypeDistributionChart(),
                    GameHighlightsSection(),
                    AchievementsMilestonesSection(),
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