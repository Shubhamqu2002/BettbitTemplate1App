import 'package:flutter/material.dart';
import '../livetabcomponents/live_casino_header.dart';
import '../livetabcomponents/live_search_filter.dart';
import '../livetabcomponents/live_trending_games_section.dart';

class LiveTabPage extends StatelessWidget {
  const LiveTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const LiveCasinoHeader(),
        const LiveSearchFilter(),
        const LiveTrendingGamesSection(),
        const LiveTrendingGamesSection(title: 'Slot Games'),
        const LiveTrendingGamesSection(title: 'Table Games'),
        const LiveTrendingGamesSection(title: 'Casino Games'),


        /// ✅ Bottom spacing (5% of screen height)
        SizedBox(height: screenHeight * 0.08),
      ],
    );
  }
}