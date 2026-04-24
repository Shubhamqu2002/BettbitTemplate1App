import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';

class LiveTrendingGamesSection extends StatelessWidget {
  final String title;

  const LiveTrendingGamesSection({
    super.key,
    this.title = 'Trending Games',
  });

  @override
  Widget build(BuildContext context) {
    final games = List.generate(
      6,
      (_) => const _LiveGameItemData(
        title: 'Book of Ra',
        provider: 'Novomatic',
        rating: '4.9',
        imagePath: 'assets/images/game.jpg',
        isNew: true,
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(right: 16),
              itemCount: games.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final game = games[index];

                return SizedBox(
                  width: 190,
                  child: LiveTrendingGameCard(
                    title: game.title,
                    provider: game.provider,
                    rating: game.rating,
                    imagePath: game.imagePath,
                    isNew: game.isNew,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LiveTrendingGameCard extends StatelessWidget {
  final String title;
  final String provider;
  final String rating;
  final String imagePath;
  final bool isNew;
  final VoidCallback? onTap;

  const LiveTrendingGameCard({
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
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
              SizedBox(
                height: 142,
                width: double.infinity,
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
                        top: 9,
                        left: 9,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.jackpotYellow,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 11,
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
                padding: const EdgeInsets.fromLTRB(13, 8, 11, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            provider,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.bottomTabInactive,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.jackpotYellow,
                          size: 15,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          rating,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
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

class _LiveGameItemData {
  final String title;
  final String provider;
  final String rating;
  final String imagePath;
  final bool isNew;

  const _LiveGameItemData({
    required this.title,
    required this.provider,
    required this.rating,
    required this.imagePath,
    required this.isNew,
  });
}