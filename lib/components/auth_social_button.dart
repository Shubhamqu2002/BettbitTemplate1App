import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/colors/app_colors.dart';

class AuthSocialButton extends StatelessWidget {
  final String title;
  final String iconText;
  final VoidCallback? onTap;

  const AuthSocialButton({
    super.key,
    required this.title,
    required this.iconText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGoogle = title.toLowerCase() == 'google';

    return SizedBox(
      height: 58,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.socialButtonFill,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.socialButtonBorder,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isGoogle ? _buildGoogleIcon() : _buildAppleIcon(),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleIcon() {
    return SizedBox(
      width: 24,
      height: 24,
      child: SvgPicture.asset(
        'assets/icons/google.svg',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildAppleIcon() {
    return const Icon(
      Icons.apple,
      color: Colors.white,
      size: 26,
    );
  }
}