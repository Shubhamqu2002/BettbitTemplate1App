import 'package:flutter/material.dart';
import '../../../../../components/auth_button.dart';
import '../../../../../config/colors/app_colors.dart';

class GameBottomCta extends StatelessWidget {
  final VoidCallback? onPlayNowTap;
  final VoidCallback? onDemoTap;

  const GameBottomCta({
    super.key,
    this.onPlayNowTap,
    this.onDemoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(
            color: AppColors.cardBorder,
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        16,
        12, // 🔥 reduced + clean spacing
        16,
        MediaQuery.of(context).padding.bottom + 10,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: AuthButton(
              title: 'Play Now',
              onTap: onPlayNowTap,
              height: 50,
              borderRadius: 12,
              fontSize: 15,
              fontWeight: FontWeight.w800,
              prefix: const Icon(
                Icons.play_arrow_rounded,
                color: AppColors.white,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 4,
            child: _DemoButton(
              onTap: onDemoTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _DemoButton({
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Material(
        color: AppColors.bottomTabBackground,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.socialButtonBorder,
                width: 1,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_circle_outline_rounded,
                  color: AppColors.white,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  'Demo',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}