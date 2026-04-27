import 'package:flutter/material.dart';
import '../../config/colors/app_colors.dart';
import '../auth_button.dart';

class Header extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onLoginTap;

  const Header({
    super.key,
    this.onMenuTap,
    this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            /// Left: Menu Icon
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onMenuTap,
              child: const SizedBox(
                width: 34,
                height: 34,
                child: Icon(
                  Icons.menu,
                  color: AppColors.white,
                  size: 26,
                ),
              ),
            ),

            /// Center: Logo + Title
            Expanded(
              child: Center(
                child: Transform.translate(
                  offset: const Offset(18, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.casino,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "MyCasino",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Right: Login/Register Button
            SizedBox(
              width: 88,
              height: 34,
              child: AuthButton(
                title: "Login/Register",
                onTap: onLoginTap,
                fontSize: 12,
                borderRadius: 20,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}