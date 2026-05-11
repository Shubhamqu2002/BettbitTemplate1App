import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameHeader extends StatelessWidget {
  final VoidCallback? onBackTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onShareTap;

  const GameHeader({
    super.key,
    this.onBackTap,
    this.onLikeTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(
            color: AppColors.cardBorder,
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        16,
        MediaQuery.of(context).padding.top + 12,
        16,
        12,
      ),
      child: Row(
        children: [
          _HeaderIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            iconColor: AppColors.white,
            onTap: onBackTap ?? () => Navigator.pop(context),
          ),
          const Spacer(),
          _HeaderIconButton(
            icon: Icons.thumb_up_rounded,
            iconColor: AppColors.jackpotYellow,
            onTap: onLikeTap,
          ),
          const SizedBox(width: 10),
          _HeaderIconButton(
            icon: Icons.share_rounded,
            iconColor: AppColors.white,
            onTap: onShareTap,
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const _HeaderIconButton({
    required this.icon,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.toggleBg,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.cardBorder,
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 21,
          ),
        ),
      ),
    );
  }
}