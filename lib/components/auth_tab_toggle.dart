import 'package:flutter/material.dart';
import '../config/colors/app_colors.dart';

class AuthTabToggle extends StatelessWidget {
  final int selectedIndex;
  final String leftTitle;
  final String rightTitle;
  final ValueChanged<int> onChanged;

  const AuthTabToggle({
    super.key,
    required this.selectedIndex,
    required this.leftTitle,
    required this.rightTitle,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.toggleBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.inputBorder,
          width: 1,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double tabWidth = (constraints.maxWidth - 6) / 2;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeInOutCubic,
                left: selectedIndex == 0 ? 0 : tabWidth,
                top: 0,
                bottom: 0,
                width: tabWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryGradientStart.withOpacity(0.20),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _TabItem(
                      title: leftTitle,
                      isSelected: selectedIndex == 0,
                      onTap: () => onChanged(0),
                    ),
                  ),
                  Expanded(
                    child: _TabItem(
                      title: rightTitle,
                      isSelected: selectedIndex == 1,
                      onTap: () => onChanged(1),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            style: TextStyle(
              color: isSelected
                  ? AppColors.white
                  : AppColors.textSecondary,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}