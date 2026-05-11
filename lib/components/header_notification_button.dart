import 'package:flutter/material.dart';
import '../config/colors/app_colors.dart';

class HeaderNotificationButton extends StatelessWidget {
  final VoidCallback? onTap;

  const HeaderNotificationButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 39,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.bottomTabBackground, // ✅ solid color
        border: Border.all(
          color: AppColors.primaryGradientStart,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGradientStart.withOpacity(0.20),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: const Center(
            child: Icon(
              Icons.notifications_rounded,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}