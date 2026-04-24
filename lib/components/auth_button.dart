import 'package:flutter/material.dart';
import '../config/colors/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double height;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Gradient? gradient;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  // 🔥 NEW
  final Widget? prefix;

  const AuthButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 56,
    this.borderRadius = 16,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.gradient,
    this.backgroundColor,
    this.padding,
    this.prefix, // 🔥 NEW
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient ?? AppColors.primaryGradient,
          color: gradient == null ? backgroundColor : null,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryGradientEnd.withOpacity(0.25),
              blurRadius: 22,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: onTap,
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🔥 ICON PART
                    if (prefix != null) ...[
                      prefix!,
                      const SizedBox(width: 10),
                    ],

                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}