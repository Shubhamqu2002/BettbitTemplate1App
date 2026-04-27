import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  static const double _cardGap = 12;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _RecentActivityHeader(),
          const SizedBox(height: 10),

          _ActivityCard(
            icon: Icons.emoji_events_rounded,
            iconColor: AppColors.searchGradientStart,
            iconBgColor: const Color(0x33BD44FF),
            iconBorderColor: const Color(0x66BD44FF),
            titleParts: const [
              _ActivityTextPart('Won '),
              _ActivityTextPart('\$250', color: AppColors.withdrawButtonBackground),
              _ActivityTextPart(' on '),
              _ActivityTextPart('Mega Fortune', color: AppColors.searchGradientStart),
            ],
            time: '2 hours ago',
            onTap: () {},
          ),

          const SizedBox(height: _cardGap),

          _ActivityCard(
            icon: Icons.account_balance_wallet_rounded,
            iconColor: AppColors.jackpotYellow,
            iconBgColor: const Color(0x33FFC700),
            iconBorderColor: const Color(0x66FFC700),
            titleParts: const [
              _ActivityTextPart('Deposited'),
            ],
            subtitle: '\$100',
            subtitleColor: AppColors.jackpotYellow,
            time: '5 hours ago',
            onTap: () {},
          ),

          const SizedBox(height: _cardGap),

          _ActivityCard(
            icon: Icons.sports_esports_rounded,
            iconColor: const Color(0xFF3B82F6),
            iconBgColor: const Color(0x333B82F6),
            iconBorderColor: const Color(0x663B82F6),
            titleParts: const [
              _ActivityTextPart('Played '),
              _ActivityTextPart('Space Invaders', color: Color(0xFF3B82F6)),
            ],
            time: '1 day ago',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _RecentActivityHeader extends StatelessWidget {
  const _RecentActivityHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Recent Activity',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.jackpotYellow,
              fontSize: 16,
              height: 1.1,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Text(
          'View All',
          style: TextStyle(
            color: AppColors.bottomTabInactive,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color iconBorderColor;
  final List<_ActivityTextPart> titleParts;
  final String? subtitle;
  final Color? subtitleColor;
  final String time;
  final VoidCallback? onTap;

  const _ActivityCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.iconBorderColor,
    required this.titleParts,
    required this.time,
    this.subtitle,
    this.subtitleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.walletCardBackground,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 76, // ✅ FIXED HERE
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.walletCardBorder,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              /// 🔹 Icon Box
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: iconBorderColor,
                    width: 1,
                  ),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 22,
                ),
              ),

              const SizedBox(width: 12),

              /// 🔹 Text Section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title (single line, no break)
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: titleParts
                            .map(
                              (item) => TextSpan(
                                text: item.text,
                                style: TextStyle(
                                  color: item.color ?? AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),

                    /// Subtitle (for deposit amount)
                    if (subtitle != null) ...[
                      const SizedBox(height: 3),
                      Text(
                        subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: subtitleColor ?? AppColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],

                    const SizedBox(height: 4),

                    /// Time
                    Text(
                      time,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textHint,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              /// 🔹 Arrow
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textHint,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _ActivityTextPart {
  final String text;
  final Color? color;

  const _ActivityTextPart(
    this.text, {
    this.color,
  });
}