import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';
import 'promotion_card.dart';

class ActivePromotionsSection extends StatefulWidget {
  const ActivePromotionsSection({super.key});

  @override
  State<ActivePromotionsSection> createState() =>
      _ActivePromotionsSectionState();
}

class _ActivePromotionsSectionState extends State<ActivePromotionsSection> {
  int selectedTabIndex = 0;

  final List<String> tabs = [
    'All',
    'Welcome Offers',
    'Reload Bonuses',
    'Cashback',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active Promotions',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Explore our latest offers and boost your gaming experience',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: tabs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final isActive = selectedTabIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTabIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF8B5CF6)
                          : AppColors.walletCardBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isActive
                            ? const Color(0xFF8B5CF6)
                            : AppColors.walletCardBorder,
                      ),
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: isActive
                            ? AppColors.white
                            : AppColors.bottomTabInactive,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 26),
          const PromotionCard(
            title: 'Weekend Reload Rush',
            subtitle: 'Get a 50% match up to \$200!',
            icon: Icons.flash_on_rounded,
            iconGradientColors: [
              Color(0xFFFF7A1A),
              Color(0xFFFF4D00),
            ],
            badgeText: 'Active',
            badgeColor: Color(0xFF8B5CF6),
            buttonText: 'Claim Offer',
            showQuickView: true,
            quickStats: [
              PromotionQuickStat(
                icon: Icons.sync_rounded,
                iconColor: Color(0xFFFF7A00),
                label: 'WAGERING',
                value: '30x Bonus',
              ),
              PromotionQuickStat(
                icon: Icons.account_balance_wallet_rounded,
                iconColor: Color(0xFFFF8A00),
                label: 'MIN. DEP',
                value: '\$20',
              ),
              PromotionQuickStat(
                icon: Icons.schedule_rounded,
                iconColor: Color(0xFF8B5CF6),
                label: 'EXPIRES',
                value: '3D 4H',
              ),
            ],
          ),
          const SizedBox(height: 18),
          const PromotionCard(
            title: 'Daily Cashback',
            subtitle: 'Get up to 15% cashback on your daily losses.',
            icon: Icons.card_giftcard_rounded,
            iconGradientColors: [
              Color(0xFFFF2D75),
              Color(0xFFE91E63),
            ],
            badgeText: 'NEW',
            badgeColor: Color(0xFF00D4FF),
            buttonText: 'Claim Offer',
            quickStats: [
              PromotionQuickStat(
                icon: Icons.percent_rounded,
                iconColor: Color(0xFFFF2D75),
                label: 'CASHBACK',
                value: '15%',
              ),
              PromotionQuickStat(
                icon: Icons.calendar_month_rounded,
                iconColor: Color(0xFF8B5CF6),
                label: 'PERIOD',
                value: 'Daily',
              ),
              PromotionQuickStat(
                icon: Icons.schedule_rounded,
                iconColor: Color(0xFFFFAB00),
                label: 'EXPIRES',
                value: '24H',
              ),
            ],
          ),
          const SizedBox(height: 18),
          const PromotionCard(
            title: 'Slot Tournament',
            subtitle: 'Prize pool of \$50,000 waiting for you!',
            icon: Icons.emoji_events_rounded,
            iconGradientColors: [
              Color(0xFF4F46E5),
              Color(0xFF2563EB),
            ],
            badgeText: 'NEW',
            badgeColor: Color(0xFF00D4FF),
            buttonText: 'Join Now',
            quickStats: [
              PromotionQuickStat(
                icon: Icons.emoji_events_rounded,
                iconColor: Color(0xFFFFC700),
                label: 'PRIZE POOL',
                value: '\$50K',
              ),
              PromotionQuickStat(
                icon: Icons.casino_rounded,
                iconColor: Color(0xFF8B5CF6),
                label: 'GAME',
                value: 'Slots',
              ),
              PromotionQuickStat(
                icon: Icons.schedule_rounded,
                iconColor: Color(0xFF00D4FF),
                label: 'ENDS IN',
                value: '5D 8H',
              ),
            ],
          ),
        ],
      ),
    );
  }
}