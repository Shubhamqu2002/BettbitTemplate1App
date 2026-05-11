import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameReviewsSection extends StatelessWidget {
  const GameReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -12),
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ReviewsHeader(),
            SizedBox(height: 12),
            _RatingCard(),
            SizedBox(height: 14),
            _ReviewItem(
              avatarText: 'S',
              avatarColor: AppColors.jackpotYellow,
              name: 'SlotMaster89',
              date: '2024-01-15',
              review:
                  'Amazing game! Hit the bonus round multiple times and the graphics are absolutely stunning.',
            ),
            _ReviewDivider(),
            _ReviewItem(
              avatarText: 'J',
              avatarColor: Color(0xFF4F8BFF),
              name: 'JackpotKing',
              date: '2024-01-14',
              review:
                  'Great volatility, but needs patience. The free spins are worth the wait.',
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewsHeader extends StatelessWidget {
  const _ReviewsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Reviews & Ratings',
            style: TextStyle(
              color: AppColors.jackpotYellow,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint('View All reviews tapped');
          },
          child: const Text(
            'View All',
            style: TextStyle(
              color: AppColors.primaryGradientEnd,
              fontSize: 13,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

class _RatingCard extends StatelessWidget {
  const _RatingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      decoration: BoxDecoration(
        color: AppColors.bottomTabBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 78,
                child: _RatingScore(),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: const [
                    _RatingProgressRow(label: '5', value: 0.80),
                    SizedBox(height: 8),
                    _RatingProgressRow(label: '4', value: 0.22),
                    SizedBox(height: 8),
                    _RatingProgressRow(label: '3', value: 0.04),
                    SizedBox(height: 8),
                    _RatingProgressRow(label: '2', value: 0.02),
                    SizedBox(height: 8),
                    _RatingProgressRow(label: '1', value: 0.01),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(
            color: AppColors.cardBorder,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 36,
            width: double.infinity,
            child: Material(
              color: AppColors.jackpotYellow,
              borderRadius: BorderRadius.circular(7),
              child: InkWell(
                borderRadius: BorderRadius.circular(7),
                onTap: null,
                child: const Center(
                  child: Text(
                    'Write a Review',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingScore extends StatelessWidget {
  const _RatingScore();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '4.9',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 32,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: List.generate(
            5,
            (_) => const Icon(
              Icons.star_rounded,
              color: AppColors.jackpotYellow,
              size: 12,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          '8,126 Ratings',
          style: TextStyle(
            color: AppColors.textHint,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _RatingProgressRow extends StatelessWidget {
  final String label;
  final double value;

  const _RatingProgressRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.bottomTabInactive,
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              minHeight: 5,
              value: value,
              backgroundColor: AppColors.cardFill,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryGradientEnd,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final String avatarText;
  final Color avatarColor;
  final String name;
  final String date;
  final String review;

  const _ReviewItem({
    required this.avatarText,
    required this.avatarColor,
    required this.name,
    required this.date,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: avatarColor,
                child: Text(
                  avatarText,
                  style: TextStyle(
                    color: avatarColor == AppColors.jackpotYellow
                        ? AppColors.black
                        : AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    ...List.generate(
                      5,
                      (_) => const Icon(
                        Icons.star_rounded,
                        color: AppColors.jackpotYellow,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                date,
                style: const TextStyle(
                  color: AppColors.bottomTabInactive,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review,
            style: const TextStyle(
              color: AppColors.bottomTabInactive,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewDivider extends StatelessWidget {
  const _ReviewDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.cardBorder,
      thickness: 1,
      height: 14,
    );
  }
}