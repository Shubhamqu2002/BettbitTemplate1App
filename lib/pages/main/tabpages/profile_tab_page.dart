import 'package:flutter/material.dart';
import '../profileTabcomponent/profile_stats_grid.dart';
import '../profileTabcomponent/profile_vip_card.dart';
import '../profileTabcomponent/profile_weekly_chart.dart';
import '../profileTabcomponent/recent_activity_section.dart';
import '../profileTabcomponent/vip_status_card.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({super.key});

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
        children: const [
          ProfileVipCard(),
          SizedBox(height: _sectionGap),
          ProfileStatsGrid(),
          SizedBox(height: _sectionGap),
          ProfileWeeklyChart(),
          SizedBox(height: _sectionGap),
          RecentActivitySection(),
          SizedBox(height: _sectionGap),
          VipStatusCard(),
          SizedBox(height: _sectionGap),
        ],
      ),
    );
  }
}