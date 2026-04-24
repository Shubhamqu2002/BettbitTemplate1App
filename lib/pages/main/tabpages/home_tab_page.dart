import 'package:flutter/material.dart';
import '../homecomponents/home_banner_section.dart';
import '../homecomponents/live_winner_section.dart';
import '../homecomponents/progressive_jackpot_card.dart';
import '../homecomponents/tournaments_section.dart';
import '../homecomponents/trending_games_section.dart';
import '../homecomponents/vip_exclusive_section.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        HomeBannerSection(
          onPlayTap: () {
            debugPrint('Play Now tapped');
          },
          onWishlistTap: () {
            debugPrint('Wishlist tapped');
          },
        ),
        const ProgressiveJackpotCard(),
        const SizedBox(height: 20),
        const TrendingGamesSection(),
        const SizedBox(height: 20),
        const LiveWinnerSection(),
        const SizedBox(height: 20),
        const TournamentsSection(),
        const SizedBox(height: 20),
        VipExclusiveSection(
          onTap: () {
            debugPrint('VIP Learn More tapped');
          },
        ),

        /// 🔥 Responsive bottom spacing (same style as LiveTab)
        SizedBox(height: screenHeight * 0.12),
      ],
    );
  }
}