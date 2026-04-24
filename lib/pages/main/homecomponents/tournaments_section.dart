import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class TournamentsSection extends StatelessWidget {
  const TournamentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const tournaments = [
      _TournamentItemData(
        title: 'Slots Championship',
        subtitle: 'Ends in 2h 15m',
        prize: '\$50K',
        playersText: '+234 players',
        progress: 0.75,
        images: [
          'assets/images/user1.jpg',
          'assets/images/user2.jpg',
          'assets/images/user3.jpg',
        ],
      ),
      _TournamentItemData(
        title: 'Roulette Masters',
        subtitle: 'Ends in 5h 42m',
        prize: '\$25K',
        playersText: '+156 players',
        progress: 0.50,
        images: [
          'assets/images/user2.jpg',
          'assets/images/user3.jpg',
          'assets/images/user1.jpg',
        ],
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        decoration: BoxDecoration(
          color: AppColors.bottomTabBackground,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: AppColors.cardBorder,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            const _TournamentsHeader(),
            const SizedBox(height: 18),
            ...List.generate(
              tournaments.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index == tournaments.length - 1 ? 0 : 14,
                ),
                child: _TournamentCard(item: tournaments[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TournamentsHeader extends StatelessWidget {
  const _TournamentsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.trophyBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.trophyBorder,
              width: 1,
            ),
          ),
          child: const Icon(
            Icons.emoji_events_rounded,
            color: AppColors.jackpotYellow,
            size: 26,
          ),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tournaments',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Compete for massive prizes',
                style: TextStyle(
                  color: AppColors.bottomTabInactive,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TournamentCard extends StatelessWidget {
  final _TournamentItemData item;

  const _TournamentCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: const TextStyle(
                        color: AppColors.bottomTabInactive,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.jackpotYellow.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  item.prize,
                  style: const TextStyle(
                    color: AppColors.jackpotYellow,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                width: 66,
                height: 28,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: List.generate(item.images.length, (index) {
                    return Positioned(
                      left: index * 18,
                      child: _TournamentAvatar(
                        imagePath: item.images[index],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                item.playersText,
                style: const TextStyle(
                  color: AppColors.bottomTabInactive,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: SizedBox(
              height: 7,
              child: LinearProgressIndicator(
                value: item.progress,
                backgroundColor: AppColors.cardBorder,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primaryGradientEnd,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TournamentAvatar extends StatelessWidget {
  final String imagePath;

  const _TournamentAvatar({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      padding: const EdgeInsets.all(1.6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.background,
        border: Border.all(
          color: AppColors.bottomTabBackground,
          width: 1.5,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TournamentItemData {
  final String title;
  final String subtitle;
  final String prize;
  final String playersText;
  final double progress;
  final List<String> images;

  const _TournamentItemData({
    required this.title,
    required this.subtitle,
    required this.prize,
    required this.playersText,
    required this.progress,
    required this.images,
  });
}