import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';
import 'trending_filter_modal.dart';

class TrendingGamesSection extends StatelessWidget {
  const TrendingGamesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final games = List.generate(
      6,
      (_) => const _GameItemData(
        title: 'Book of Ra',
        provider: 'Novomatic',
        rating: '4.9',
        imagePath: 'assets/images/game.jpg',
        isNew: true,
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trending Games',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  TrendingFilterModal.show(context);
                },
                child: Container(
                  width: 38,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.bottomTabBackground,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.cardBorder,
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.tune_rounded,
                    color: AppColors.primaryGradientEnd,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 14.0;
              final cardWidth = (constraints.maxWidth - spacing) / 2;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: games.map((game) {
                  return SizedBox(
                    width: cardWidth,
                    child: AspectRatio(
                      aspectRatio: 0.82,
                      child: TrendingGameCard(
                        title: game.title,
                        provider: game.provider,
                        rating: game.rating,
                        imagePath: game.imagePath,
                        isNew: game.isNew,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TrendingGameCard extends StatelessWidget {
  final String title;
  final String provider;
  final String rating;
  final String imagePath;
  final bool isNew;
  final VoidCallback? onTap;

  const TrendingGameCard({
    super.key,
    required this.title,
    required this.provider,
    required this.rating,
    required this.imagePath,
    this.isNew = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.bottomTabBackground,
            border: Border.all(
              color: AppColors.cardBorder,
              width: 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (isNew)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.jackpotYellow,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: AppColors.bottomTabBackground,
                padding: const EdgeInsets.fromLTRB(16, 13, 14, 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            provider,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.bottomTabInactive,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.jackpotYellow,
                          size: 17,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameItemData {
  final String title;
  final String provider;
  final String rating;
  final String imagePath;
  final bool isNew;

  const _GameItemData({
    required this.title,
    required this.provider,
    required this.rating,
    required this.imagePath,
    required this.isNew,
  });
}