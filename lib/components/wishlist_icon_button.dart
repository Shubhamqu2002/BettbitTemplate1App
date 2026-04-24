import 'package:flutter/material.dart';
import '../config/colors/app_colors.dart';

class WishlistIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final bool isSelected;

  const WishlistIconButton({
    super.key,
    this.onTap,
    this.size = 56,
    this.iconSize = 24,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.wishlistBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.wishlistBorder,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Center(
              child: Icon(
                isSelected ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                size: iconSize,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}