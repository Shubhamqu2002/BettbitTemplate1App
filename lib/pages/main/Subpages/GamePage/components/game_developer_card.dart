import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameDeveloperCard extends StatelessWidget {
  const GameDeveloperCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -12),
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.bottomTabBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.cardBorder,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF4D4F),
                      Color(0xFFFF8A3D),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PP',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Play'n GO",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '200+ Games',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.bottomTabInactive,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    debugPrint('View All tapped');
                  },
                  child: Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.cardFill,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.wishlistBorder,
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}