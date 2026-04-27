import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class ProfileVipCard extends StatelessWidget {
  const ProfileVipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: AppColors.vipGradientStart,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 34,
              backgroundImage: AssetImage('assets/images/user1.jpg'),
              backgroundColor: AppColors.cardBg,
            ),

            const SizedBox(width: 14),

            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.bottomTabInactive,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'John Doe!',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 36,
                  width: 92,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: AppColors.vipCardGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Gold',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Member since Jan 2024',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}