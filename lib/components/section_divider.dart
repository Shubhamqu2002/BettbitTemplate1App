import 'package:flutter/material.dart';
import '../config/colors/app_colors.dart';

class SectionDivider extends StatelessWidget {
  final String text;

  const SectionDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.divider,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.divider,
          ),
        ),
      ],
    );
  }
}