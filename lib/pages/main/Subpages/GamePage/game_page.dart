import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';
import '../../livetabcomponents/live_trending_games_section.dart';

import 'components/game_header.dart';
import 'components/game_media_preview.dart';
import 'components/game_details_section.dart';
import 'components/game_bottom_cta.dart';
import 'components/game_info_tabs.dart';
import 'components/game_live_info_banner.dart';
import 'components/game_jackpot_banner.dart';
import 'components/game_about_section.dart';
import 'components/game_developer_card.dart';
import 'components/game_reviews_section.dart';

class GamePage extends StatelessWidget {
  final String gameTitle;
  final String provider;
  final String imagePath;

  const GamePage({
    super.key,
    required this.gameTitle,
    required this.provider,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const GameHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  const GameMediaPreview(),
                  GameDetailsSection(
                    title: gameTitle,
                    provider: provider,
                  ),
                  const GameInfoTabs(),
                  const GameLiveInfoBanner(),
                  const GameJackpotBanner(),
                  const GameAboutSection(),
                  const GameDeveloperCard(),
                  const GameReviewsSection(),

                  Transform.translate(
                    offset: const Offset(0, -14),
                    child: const LiveTrendingGamesSection(
                      title: 'Recommended for You',
                      titleIcon: Icons.local_fire_department_rounded,
                      titleIconColor: AppColors.jackpotYellow,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GameBottomCta(
            onPlayNowTap: () {
              debugPrint('Play Now tapped');
            },
            onDemoTap: () {
              debugPrint('Demo tapped');
            },
          ),
        ],
      ),
    );
  }
}