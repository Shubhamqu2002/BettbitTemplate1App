import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';

class LiveCasinoHeader extends StatelessWidget {
  const LiveCasinoHeader({super.key});

  static const Color _redDot = Color(0xFFEF4444);
  static const Color _yellowIcon = Color(0xFFFFC700);
  static const Color _purpleIcon = Color(0xFFBD44FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 6),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LiveTitleRow(),
          SizedBox(height: 12),
          _LiveSubtitle(),
          SizedBox(height: 16),
          _LiveStatsRow(),
        ],
      ),
    );
  }
}

class _LiveTitleRow extends StatelessWidget {
  const _LiveTitleRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: LiveCasinoHeader._redDot,
        ),
        SizedBox(width: 12),
        Text(
          'Live Casino',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            height: 1.1,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _LiveSubtitle extends StatelessWidget {
  const _LiveSubtitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Real dealers, real-time action with professional\nplayers worldwide',
      style: TextStyle(
        color: AppColors.bottomTabInactive,
        fontSize: 14,
        height: 1.35,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _LiveStatsRow extends StatelessWidget {
  const _LiveStatsRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _LiveStatItem(
          icon: Icons.groups_rounded,
          iconColor: LiveCasinoHeader._yellowIcon,
          text: '1,247 playing',
        ),
        SizedBox(width: 22),
        _LiveStatItem(
          icon: Icons.videocam_rounded,
          iconColor: LiveCasinoHeader._purpleIcon,
          text: '24 tables',
        ),
      ],
    );
  }
}

class _LiveStatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const _LiveStatItem({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 18,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}