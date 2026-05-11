import 'package:flutter/material.dart';
import '../../../../../components/auth_tab_toggle.dart';
import '../../../../../config/colors/app_colors.dart';

class GameInfoTabs extends StatefulWidget {
  const GameInfoTabs({super.key});

  @override
  State<GameInfoTabs> createState() => _GameInfoTabsState();
}

class _GameInfoTabsState extends State<GameInfoTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -10),
      child: Container(
        color: AppColors.background,
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
        child: Column(
          children: [
            AuthTabToggle(
              selectedIndex: selectedIndex,
              leftTitle: 'Details',
              rightTitle: 'Features',
              onChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: selectedIndex == 0
                  ? const _DetailsCard(key: ValueKey('details'))
                  : const _FeaturesCard(key: ValueKey('features')),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 24, 16, 24),
      decoration: BoxDecoration(
        color: AppColors.bottomTabBackground,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  icon: Icons.pie_chart_rounded,
                  iconColor: Color(0xFF4AF28B),
                  iconBgColor: Color(0xFF10292E),
                  label: 'RTP',
                  value: '96.51%',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _InfoItem(
                  icon: Icons.ssid_chart_rounded,
                  iconColor: Color(0xFFFF747A),
                  iconBgColor: Color(0xFF361028),
                  label: 'VOLATILITY',
                  value: 'High',
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  icon: Icons.workspace_premium_rounded,
                  iconColor: AppColors.jackpotYellow,
                  iconBgColor: Color(0xFF302018),
                  label: 'MAX WIN',
                  value: '21,000x',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _InfoItem(
                  icon: Icons.stacked_line_chart_rounded,
                  iconColor: Color(0xFF5B8DFF),
                  iconBgColor: Color(0xFF11183A),
                  label: 'PAYLINES',
                  value: '25',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeaturesCard extends StatelessWidget {
  const _FeaturesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      decoration: BoxDecoration(
        color: AppColors.bottomTabBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
      ),
      child: const Column(
        children: [
          _FeatureItem(
            title: 'Bonus Wheel',
            description:
                'Spin The Wheel To Win Instant Prizes And Multipliers Up To 500x.',
          ),
          SizedBox(height: 22),
          _FeatureItem(
            title: 'Multipliers',
            description:
                'Stack Multipliers Up To 10x On Winning Combinations.',
          ),
          SizedBox(height: 22),
          _FeatureItem(
            title: 'Free Spins',
            description:
                'Trigger Up To 20 Free Spins With Sticky Expanding Wilds.',
          ),
          SizedBox(height: 22),
          _FeatureItem(
            title: 'Bonus Wheel',
            description:
                'Spin The Wheel To Win Instant Prizes And Multipliers Up To 500x.',
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const _FeatureItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 31,
          height: 31,
          decoration: const BoxDecoration(
            color: Color(0xFF8736C7),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.pie_chart_rounded,
            color: Color(0xFFC76BFF),
            size: 17,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.bottomTabInactive,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  maxLines: 1,
                  style: const TextStyle(
                    color: AppColors.bottomTabInactive,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  maxLines: 1,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}