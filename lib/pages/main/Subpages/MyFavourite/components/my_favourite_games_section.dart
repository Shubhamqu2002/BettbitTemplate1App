import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../GamePage/game_page.dart';

class MyFavouriteGamesSection extends StatelessWidget {
  const MyFavouriteGamesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final games = List.generate(
      6,
      (_) => const _FavouriteGameData(
        title: 'Book of Ra',
        provider: 'Novomatic',
        rating: '4.9',
        imagePath: 'assets/images/game.jpg',
        isNew: true,
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(23, 18, 23, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FavouriteSectionHeader(),
          const SizedBox(height: 26),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 22.0;
              final cardWidth = (constraints.maxWidth - spacing) / 2;

              return Wrap(
                spacing: spacing,
                runSpacing: 20,
                children: games.map((game) {
                  return SizedBox(
                    width: cardWidth,
                    child: AspectRatio(
                      aspectRatio: 0.78,
                      child: FavouriteGameCard(
                        title: game.title,
                        provider: game.provider,
                        rating: game.rating,
                        imagePath: game.imagePath,
                        isNew: game.isNew,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => GamePage(
                                gameTitle: game.title,
                                provider: game.provider,
                                imagePath: game.imagePath,
                              ),
                            ),
                          );
                        },
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

class _FavouriteSectionHeader extends StatelessWidget {
  const _FavouriteSectionHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Favorites',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You have 6 favorite games',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Text(
            'View all',
            style: TextStyle(
              color: AppColors.bottomTabInactive,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class FavouriteGameCard extends StatelessWidget {
  final String title;
  final String provider;
  final String rating;
  final String imagePath;
  final bool isNew;
  final VoidCallback? onTap;

  const FavouriteGameCard({
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
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.bottomTabBackground,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.cardBorder,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
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
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.jackpotYellow,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'NEW',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: AppColors.jackpotYellow,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_rounded,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: AppColors.bottomTabBackground,
                  padding: const EdgeInsets.fromLTRB(14, 13, 12, 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              provider,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.bottomTabInactive,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
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
                              fontSize: 13,
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
      ),
    );
  }
}

class _FavouriteGameData {
  final String title;
  final String provider;
  final String rating;
  final String imagePath;
  final bool isNew;

  const _FavouriteGameData({
    required this.title,
    required this.provider,
    required this.rating,
    required this.imagePath,
    required this.isNew,
  });
}