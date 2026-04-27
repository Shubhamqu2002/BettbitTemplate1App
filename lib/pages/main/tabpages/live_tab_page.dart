import 'package:flutter/material.dart';
import '../livetabcomponents/live_casino_header.dart';
import '../livetabcomponents/live_search_filter.dart';
import '../livetabcomponents/live_trending_games_section.dart';

class LiveTabPage extends StatelessWidget {
  const LiveTabPage({super.key});

  static const double _bottomSpacingFactor = 0.08;

  static const List<String> _sections = [
    'Trending Games',
    'Slot Games',
    'Table Games',
    'Casino Games',
  ];

  @override
  Widget build(BuildContext context) {
    final bottomSpacing =
        MediaQuery.sizeOf(context).height * _bottomSpacingFactor;

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: bottomSpacing),
        children: [
          const LiveCasinoHeader(),
          const LiveSearchFilter(),

          /// Dynamic sections (scalable)
          ..._sections.map(
            (title) => LiveTrendingGamesSection(title: title),
          ),
        ],
      ),
    );
  }
}