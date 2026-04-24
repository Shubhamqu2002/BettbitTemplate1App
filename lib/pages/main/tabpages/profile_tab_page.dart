import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Tab Working',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}