import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class PromotionQuickStat {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const PromotionQuickStat({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });
}

class PromotionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> iconGradientColors;
  final String badgeText;
  final Color badgeColor;
  final String buttonText;
  final bool showQuickView;
  final List<PromotionQuickStat> quickStats;

  const PromotionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconGradientColors,
    required this.badgeText,
    required this.badgeColor,
    required this.buttonText,
    this.showQuickView = false,
    required this.quickStats,
  });

  @override
  State<PromotionCard> createState() => _PromotionCardState();
}

class _PromotionCardState extends State<PromotionCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  static const LinearGradient _claimGradient = LinearGradient(
    colors: [
      Color(0xFF9333EA),
      Color(0xFF7C3AED),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.walletCardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isExpanded
              ? AppColors.searchGradientStart.withOpacity(0.75)
              : AppColors.walletCardBorder,
          width: 1,
        ),
        boxShadow: isExpanded
            ? [
                BoxShadow(
                  color: AppColors.searchGradientStart.withOpacity(0.30),
                  blurRadius: 24,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TopRow(widget: widget),
          const SizedBox(height: 16),
          Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            widget.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              height: 1.35,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: _claimGradient,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF9333EA).withOpacity(0.35),
                        blurRadius: 14,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.buttonText,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(width: 7),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.white,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  decoration: BoxDecoration(
                    color: AppColors.cardBg.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.walletCardBorder,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Details',
                        style: TextStyle(
                          color: AppColors.bottomTabInactive,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(width: 5),
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.bottomTabInactive,
                          size: 19,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ClipRect(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: isExpanded
                  ? const SizedBox.shrink()
                  : const SizedBox.shrink(),
            ),
          ),
          ClipRect(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: isExpanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: _ExpandedPromotionDetails(
                        quickStats: widget.quickStats,
                      ),
                    )
                  : const SizedBox(width: double.infinity, height: 0),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandedPromotionDetails extends StatelessWidget {
  final List<PromotionQuickStat> quickStats;

  const _ExpandedPromotionDetails({
    required this.quickStats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'QUICK VIEW',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: quickStats.map((item) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _QuickStatCard(stat: item),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.36),
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: AppColors.walletCardBorder.withOpacity(0.45),
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'This promotion is valid for all registered players. The bonus must be wagered 35 times before withdrawal. Maximum bet with active bonus is \$5. Bonus expires 30 days after activation. Standard terms and conditions apply.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  height: 1.45,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopRow extends StatelessWidget {
  final PromotionCard widget;

  const _TopRow({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.iconGradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(
            widget.icon,
            color: AppColors.white,
            size: 24,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: widget.badgeColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.badgeColor.withOpacity(0.55),
            ),
          ),
          child: Text(
            widget.badgeText,
            style: TextStyle(
              color: widget.badgeColor,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickStatCard extends StatelessWidget {
  final PromotionQuickStat stat;

  const _QuickStatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.72),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.walletCardBorder.withOpacity(0.35),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            stat.icon,
            color: stat.iconColor,
            size: 16,
          ),
          const SizedBox(height: 5),
          Text(
            stat.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            stat.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}