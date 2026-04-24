import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class VipExclusiveSection extends StatelessWidget {
  final VoidCallback? onTap;

  const VipExclusiveSection({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.vipCardGradient,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -26,
              right: -10,
              child: Container(
                width: 128,
                height: 128,
                decoration: const BoxDecoration(
                  color: AppColors.vipOverlay,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -28,
              left: -28,
              child: Container(
                width: 78,
                height: 78,
                decoration: const BoxDecoration(
                  color: AppColors.vipOverlay,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.workspace_premium_rounded,
                        color: AppColors.background,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'VIP Exclusive',
                        style: TextStyle(
                          color: AppColors.background,
                          fontSize: 22, // slightly bigger
                          fontWeight: FontWeight.w900, // more bold
                          letterSpacing: 0.5, // premium feel
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Unlock Premium Games',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 32,
                      height: 1.1,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.8,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Join our VIP club and get access to\nexclusive tables with higher limits',
                    style: TextStyle(
                      color: AppColors.vipSubtext,
                      fontSize: 15,
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: onTap,
                      child: Container(
                        width: double.infinity,
                        height: 46,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Learn More',
                          style: TextStyle(
                            color: AppColors.jackpotYellow,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
