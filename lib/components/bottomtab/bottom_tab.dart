import 'package:flutter/material.dart';
import '../../config/colors/app_colors.dart';

class BottomTab extends StatelessWidget {
  final int currentIndex;
  final bool isScrolling;
  final ValueChanged<int> onTabChanged;
  final VoidCallback? onSearchTap;

  const BottomTab({
    super.key,
    required this.currentIndex,
    required this.isScrolling,
    required this.onTabChanged,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    const double totalHeight = 72;
    const double barHeight = 56;
    const double searchSize = 60;

    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: totalHeight,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: barHeight,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: isScrolling
                      ? Colors.transparent
                      : AppColors.bottomTabBackground,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _BottomTabItem(
                        icon: Icons.home_rounded,
                        label: 'Home',
                        isActive: currentIndex == 0,
                        onTap: () => onTabChanged(0),
                      ),
                    ),
                    Expanded(
                      child: _BottomTabItem(
                        icon: Icons.local_activity_rounded,
                        label: 'Live',
                        isActive: currentIndex == 1,
                        onTap: () => onTabChanged(1),
                      ),
                    ),
                    const SizedBox(width: 76),
                    Expanded(
                      child: _BottomTabItem(
                        icon: Icons.account_balance_wallet_rounded,
                        label: 'Wallet',
                        isActive: currentIndex == 2,
                        onTap: () => onTabChanged(2),
                      ),
                    ),
                    Expanded(
                      child: _BottomTabItem(
                        icon: Icons.person_rounded,
                        label: 'Profile',
                        isActive: currentIndex == 3,
                        onTap: () => onTabChanged(3),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: barHeight - (searchSize / 2),
              child: GestureDetector(
                onTap: onSearchTap,
                child: Container(
                  width: searchSize,
                  height: searchSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.searchGradientStart.withOpacity(0.45),
                        blurRadius: 22,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.searchBorder,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.searchGradient,
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        color: AppColors.white,
                        size: 34,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomTabItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomTabItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isActive
        ? AppColors.searchGradientStart
        : AppColors.bottomTabInactive;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: 54,
        child: _BottomTabItemContent(
          icon: icon,
          label: label,
          color: color,
          isActive: isActive,
        ),
      ),
    );
  }
}

class _BottomTabItemContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isActive;

  const _BottomTabItemContent({
    required this.icon,
    required this.label,
    required this.color,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 21, color: color),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}