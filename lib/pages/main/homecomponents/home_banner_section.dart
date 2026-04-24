import 'package:flutter/material.dart';
import '../../../components/auth_button.dart';
import '../../../components/wishlist_icon_button.dart';
import '../../../config/colors/app_colors.dart';

class HomeBannerSection extends StatelessWidget {
  final VoidCallback? onPlayTap;
  final VoidCallback? onWishlistTap;

  const HomeBannerSection({super.key, this.onPlayTap, this.onWishlistTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 372,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/banner.jpg', fit: BoxFit.cover),

          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.bannerTopGradient,
            ),
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.bannerBottomGradient,
            ),
          ),

          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 182, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      _BannerTag(
                        title: 'LIVE',
                        backgroundColor: AppColors.primaryGradientEnd,
                      ),
                      SizedBox(width: 8),
                      _BannerTag(
                        title: 'HOT',
                        backgroundColor: AppColors.bannerHotTag,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Live Texas Holdem',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 31,
                      height: 1.05,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Real dealers, real-time action with pro players.',
                    style: TextStyle(
                      color: AppColors.bannerSubtitle,
                      fontSize: 15,
                      height: 1.35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: AuthButton(
                          title: 'Play Now',
                          onTap: onPlayTap,
                          height: 50,
                          borderRadius: 16,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,

                          // 🔥 BEAUTIFUL PLAY ICON (same like image)
                          prefix: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      WishlistIconButton(
                        onTap: onWishlistTap,
                        size: 50,
                        iconSize: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerTag extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const _BannerTag({required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
