import 'package:flutter/material.dart';
import '../../../../components/auth_button.dart';
import '../../../../config/colors/app_colors.dart';

class LiveFilterModal extends StatefulWidget {
  const LiveFilterModal({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.55),
      builder: (_) => const Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: LiveFilterModal(),
      ),
    );
  }

  @override
  State<LiveFilterModal> createState() => _LiveFilterModalState();
}

class _LiveFilterModalState extends State<LiveFilterModal> {
  String selectedCategory = 'All Games';
  double betValue = 0.45;

  final List<_FilterItem> categories = const [
    _FilterItem(title: 'All Games'),
    _FilterItem(title: 'Live Casino', icon: '♜'),
    _FilterItem(title: 'Table', icon: '🎰'),
    _FilterItem(title: 'Slots', icon: '♜'),
    _FilterItem(title: 'Sports', icon: '🎰'),
    _FilterItem(title: 'Jackpot', icon: '🎰'),
  ];

  void _clearAll() {
    setState(() {
      selectedCategory = 'All Games';
      betValue = 0.45;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final chipSpacing = screenWidth < 360 ? 8.0 : 10.0;
    final chipRunSpacing = screenWidth < 360 ? 10.0 : 12.0;
    final chipHorizontalPadding = screenWidth < 360 ? 12.0 : 15.0;
    final modalHorizontalPadding = screenWidth < 360 ? 16.0 : 20.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        modalHorizontalPadding,
        18,
        modalHorizontalPadding,
        20,
      ),
      decoration: BoxDecoration(
        color: AppColors.searchModalBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Live Game Filters',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _clearAll,
                  child: const Text(
                    'Clear All',
                    style: TextStyle(
                      color: AppColors.searchGradientStart,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.10),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.white,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            /// CATEGORY
            const Text(
              'Game Category',
              style: TextStyle(
                color: AppColors.bottomTabInactive,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: chipSpacing,
              runSpacing: chipRunSpacing,
              children: categories.map((item) {
                final isSelected = selectedCategory == item.title;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = item.title;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: EdgeInsets.symmetric(
                      horizontal: chipHorizontalPadding,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.searchGradientStart
                          : AppColors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (item.icon != null) ...[
                          Text(item.icon!, style: const TextStyle(fontSize: 14)),
                          const SizedBox(width: 5),
                        ],
                        Text(
                          item.title,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: screenWidth < 360 ? 12 : 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 28),

            /// BET RANGE
            const Text(
              'Bet Range',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            /// VALUES (aligned)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$0.10',
                    style: TextStyle(
                      color: AppColors.bottomTabInactive,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$10,000',
                    style: TextStyle(
                      color: AppColors.bottomTabInactive,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            /// SLIDER (perfect alignment fix)
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8,
                trackShape: const RoundedRectSliderTrackShape(),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 8),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 16),
                activeTrackColor: AppColors.searchGradientStart,
                inactiveTrackColor:
                    AppColors.bottomTabInactive.withOpacity(0.45),
                thumbColor: AppColors.searchGradientStart,
                overlayColor:
                    AppColors.searchGradientStart.withOpacity(0.16),
              ),
              child: Slider(
                padding: EdgeInsets.zero, // 🔥 FIX
                value: betValue,
                min: 0,
                max: 1,
                onChanged: (value) {
                  setState(() {
                    betValue = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 16),

            /// BUTTON
            AuthButton(
              title: 'Apply Filters',
              onTap: () => Navigator.pop(context),
              height: 56,
              borderRadius: 10,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterItem {
  final String title;
  final String? icon;

  const _FilterItem({
    required this.title,
    this.icon,
  });
}