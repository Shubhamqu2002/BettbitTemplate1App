import 'dart:ui';
import 'package:flutter/material.dart';
import '../config/colors/app_colors.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Positioned.fill(
            child: _BlurBackgroundLayer(),
          ),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}

class _BlurBackgroundLayer extends StatelessWidget {
  const _BlurBackgroundLayer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-left purple — single soft circle, mostly off-screen
        Positioned(
          top: -120,
          left: -120,
          child: IgnorePointer(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 70,
                sigmaY: 70,
              ),
              child: Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x4DB026FF),
                ),
              ),
            ),
          ),
        ),

        // Bottom-right orange — smaller, more blurred, slightly left from corner
        Positioned(
          bottom: -110,
          right: -55,
          child: IgnorePointer(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 110,
                sigmaY: 110,
              ),
              child: Container(
                width: 220,
                height: 220,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x28FF6B00),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}