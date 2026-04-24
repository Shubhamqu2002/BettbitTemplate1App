import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class TrendingFilterModal extends StatelessWidget {
  const TrendingFilterModal({super.key});

  static Future<void> show(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierLabel: 'Trending Filter',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.45),
      transitionDuration: const Duration(milliseconds: 220),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const TrendingFilterModal();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );

        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.94, end: 1).animate(curved),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final recentSearches = ['Live Games', 'Slots', 'Promotions'];
    final trendingTags = ['New', 'jackpot', 'Fantasy'];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 390),
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
                decoration: BoxDecoration(
                  color: AppColors.searchModalBackground,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: AppColors.cardBorder,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 28,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.searchModalInputBorder,
                                width: 1.4,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search_rounded,
                                  color: AppColors.white,
                                  size: 22,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    autofocus: true,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    cursorColor: AppColors.searchModalInputBorder,
                                    decoration: const InputDecoration(
                                      isCollapsed: true,
                                      border: InputBorder.none,
                                      hintText: 'Search...',
                                      hintStyle: TextStyle(
                                        color: AppColors.bottomTabInactive,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            height: 42,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: AppColors.searchModalChipBackground,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: AppColors.cardBorder,
                                width: 1,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Recent Searches',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...recentSearches.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                color: AppColors.bottomTabInactive,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  color: AppColors.bottomTabInactive,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.close_rounded,
                              color: AppColors.bottomTabInactive.withOpacity(0.7),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: AppColors.searchModalDivider,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Trending',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: trendingTags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.searchModalChipBackground,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.cardBorder,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (tag == 'New' || tag == 'jackpot')
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Text(
                                    '#',
                                    style: TextStyle(
                                      color: AppColors.searchModalInputBorder,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              Text(
                                tag,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}