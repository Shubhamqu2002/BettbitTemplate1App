import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF08010F);

  static const Color purpleBlur = Color(0xFFB026FF);
  static const Color orangeBlur = Color(0xFFFF6B00);

  static const Color primaryGradientStart = Color(0xFFB026FF);
  static const Color primaryGradientEnd = Color(0xFFD926FF);

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color textPrimary = Color(0xFFF7F4FF);
  static const Color textSecondary = Color(0xFF8D869A);
  static const Color textHint = Color(0xFF5E5867);

  static const Color cardBg = Color(0xFF1E1F26);

  static const Color cardBorder = Color(0xFF23172D);
  static const Color cardFill = Color(0x1AFFFFFF);

  static const Color inputFill = Color(0xFF0E0715);
  static const Color inputBorder = Color(0xFF2B1C36);

  static const Color toggleBg = Color(0xFF0A0A0F);
  static const Color divider = Color(0xFF2A2232);

  static const Color socialButtonFill = Color(0xFF1A1321);
  static const Color socialButtonBorder = Color(0xFF2C2333);
  static const Color menuBackground = Color(0xFF1A0B2E);

  static const Color bottomTabBackground = Color(0xFF1A0B2E);
  static const Color bottomTabInactive = Color(0xFF9CA3AF);
  static const Color searchGradientStart = Color(0xFFBD44FF);
  static const Color searchGradientEnd = Color(0xFF4F46E5);
  static const Color searchBorder = Color(0xFF08010F);

  static const Color jackpotYellow = Color(0xFFFFC700);
  static const Color jackpotCardBorder = Color(0xFFFFC700);

  static const Color bannerHotTag = Color(0xFFFF4D4F);
  static const Color bannerSubtitle = Color(0xFFE8DBF4);
  static const Color wishlistBackground = Color(0x3DFFFFFF);
  static const Color wishlistBorder = Color(0x26FFFFFF);

  static const Color bannerGradientSolid = Color(0xFF08010F);
  static const Color bannerGradientSoft = Color(0xCC08010F);
  static const Color bannerGradientTransparent = Color(0x0008010F);

  static const Color liveWinnerSelectedStart = Color(0x33BD44FF);
  static const Color liveWinnerSelectedEnd = Color(0x00BD44FF);
  static const Color trophyBackground = Color(0x1AFFC700);
  static const Color trophyBorder = Color(0x33FFC700);

  static const Color vipGradientStart = Color(0xFFFFC700);
  static const Color vipGradientEnd = Color(0xFFFF9500);
  static const Color yellowButton = Color(0xFFFFAB00);
  static const Color vipSubtext = Color(0xCC08010F);
  static const Color vipOverlay = Color(0x14FFFFFF);

  static const Color searchModalBackground = Color(0xE61A0B2E);
  static const Color searchModalChipBackground = Color(0x802D1B4E);
  static const Color searchModalInputBorder = Color(0xFF6A42F4);
  static const Color searchModalDivider = Color(0xFF2B1847);

  static const Color walletCardBackground = Color(0xFF15161C);
  static const Color walletCardBorder = Color(0xFF2A2B35);
  static const Color withdrawButtonBackground = Color(0xFF00E676);

  static const Color depositIconBg = Color(0x33D500F9);
  static const Color withdrawIconBg = Color(0x3300E676);
  static const Color netActivityIconBg = Color(0x33FFAB00);

  static const Color transactionDivider = Color(0xFF272832);

  static const Color exportButtonBg = Color(0x1AD926FF);
  static const Color exportButtonBorder = Color(0x80D926FF);

  static const Color depositBadgeBg = Color(0x3300E676);
  static const Color depositBadgeBorder = Color(0x6600E676);

  static const Color withdrawalBadgeBg = Color(0x33FFAB00);
  static const Color withdrawalBadgeBorder = Color(0x66FFAB00);

  static const Color paginationBg = Color(0xFF1E1F26);
  static const Color paginationActiveBg = Color(0xFFD926FF);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryGradientStart, primaryGradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient searchGradient = LinearGradient(
    colors: [searchGradientStart, searchGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient liveWinnerSelectedGradient = LinearGradient(
    colors: [liveWinnerSelectedStart, liveWinnerSelectedEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient vipCardGradient = LinearGradient(
    colors: [vipGradientStart, vipGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient bannerTopGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      bannerGradientSolid,
      bannerGradientSoft,
      bannerGradientTransparent,
    ],
    stops: [0.0, 0.22, 0.48],
  );

  static const LinearGradient bannerBottomGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      bannerGradientTransparent,
      bannerGradientSoft,
      bannerGradientSolid,
    ],
    stops: [0.45, 0.78, 1.0],
  );
}