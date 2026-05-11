import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameJackpotBanner extends StatelessWidget {
  const GameJackpotBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -14), // 🔥 moved more upward
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const RadialGradient(
              center: Alignment.center,
              radius: 1.15,
              colors: [
                Color(0xFF150918),
                Color(0xFF0D0411),
                AppColors.background,
              ],
              stops: [0.0, 0.48, 1.0],
            ),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CURRENT JACKPOT',
                style: TextStyle(
                  color: AppColors.jackpotYellow,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$ 4,500.90',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  height: 1,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}