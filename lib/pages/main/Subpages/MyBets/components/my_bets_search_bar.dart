import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class MyBetsSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const MyBetsSearchBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.toggleBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.inputBorder,
          width: 1,
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: AppColors.primaryGradientEnd,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
          height: 1.2,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, right: 8),
            child: Icon(
              Icons.search_rounded,
              color: AppColors.bottomTabInactive,
              size: 22,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 42,
            minHeight: 42,
          ),
          hintText: 'Search games...',
          hintStyle: TextStyle(
            color: AppColors.textHint,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
          contentPadding: EdgeInsets.only(
            top: 14,
            bottom: 12,
            right: 14,
          ),
        ),
      ),
    );
  }
}