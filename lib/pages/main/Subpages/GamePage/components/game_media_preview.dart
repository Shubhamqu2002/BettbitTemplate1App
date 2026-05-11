import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameMediaPreview extends StatefulWidget {
  const GameMediaPreview({super.key});

  @override
  State<GameMediaPreview> createState() => _GameMediaPreviewState();
}

class _GameMediaPreviewState extends State<GameMediaPreview> {
  int selectedIndex = 0;

  final List<String> mediaImages = const [
    'assets/images/game.jpg',
    'assets/images/game1.jpg',
    'assets/images/game2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final selectedImage = mediaImages[selectedIndex];

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.22,
            child: Image.asset(
              selectedImage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppColors.bannerBottomGradient,
              ),
            ),
          ),

          /// 🔥 Play Button (ONLY for first image & moved upward)
          if (selectedIndex == 0)
            Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: Transform.translate(
                    offset: const Offset(0, -20), // 👈 moved upward
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.jackpotYellow.withOpacity(0.92),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.35),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: AppColors.black,
                        size: 46,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(mediaImages.length, (index) {
                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    margin: EdgeInsets.only(
                      right: index == mediaImages.length - 1 ? 0 : 10,
                    ),
                    width: isSelected ? 78 : 76,
                    height: 54,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: isSelected ? AppColors.vipCardGradient : null,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.jackpotYellow
                            : AppColors.wishlistBorder,
                        width: isSelected ? 2 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color:
                                    AppColors.jackpotYellow.withOpacity(0.45),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            mediaImages[index],
                            fit: BoxFit.cover,
                          ),

                          /// 🔥 Play icon on FIRST thumbnail only
                          if (index == 0)
                            Center(
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.jackpotYellow,
                                ),
                                child: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: AppColors.black,
                                  size: 16,
                                ),
                              ),
                            ),

                          if (!isSelected)
                            Container(
                              color: AppColors.black.withOpacity(0.35),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}