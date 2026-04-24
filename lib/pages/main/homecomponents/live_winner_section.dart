import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class LiveWinnerSection extends StatelessWidget {
  const LiveWinnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    const winners = [
      _WinnerItemData(
        name: 'Alex xm.',
        subtitle: 'Lucky Spin!',
        amount: '\$500.90',
        time: 'Just now',
        imagePath: 'assets/images/user1.jpg',
        isSelected: true,
      ),
      _WinnerItemData(
        name: 'Sarah J.',
        subtitle: 'Real-time win',
        amount: '\$124.50',
        time: '2m ago',
        imagePath: 'assets/images/user2.jpg',
      ),
      _WinnerItemData(
        name: 'Mike R.',
        subtitle: 'Real-time win',
        amount: '\$892.00',
        time: '5m ago',
        imagePath: 'assets/images/user3.jpg',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
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
            const _LiveWinnerHeader(),
            const SizedBox(height: 18),
            ...List.generate(
              winners.length,
              (index) => _WinnerTile(
                item: winners[index],
                showDivider: index != winners.length - 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LiveWinnerHeader extends StatelessWidget {
  const _LiveWinnerHeader();

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
                'Live Winner',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Real-time wins happening now',
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

class _WinnerTile extends StatelessWidget {
  final _WinnerItemData item;
  final bool showDivider;

  const _WinnerTile({
    required this.item,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    final tile = Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        gradient:
            item.isSelected ? AppColors.liveWinnerSelectedGradient : null,
        color: item.isSelected ? null : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _WinnerAvatar(
            imagePath: item.imagePath,
            isSelected: item.isSelected,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.amount,
                style: const TextStyle(
                  color: AppColors.jackpotYellow,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.time,
                style: const TextStyle(
                  color: AppColors.bottomTabInactive,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    if (!showDivider) return tile;

    return Column(
      children: [
        tile,
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Divider(
            color: AppColors.divider,
            thickness: 1,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _WinnerAvatar extends StatelessWidget {
  final String imagePath;
  final bool isSelected;

  const _WinnerAvatar({
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        width: 46,
        height: 46,
        padding: const EdgeInsets.all(2.2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.primaryGradient,
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.background,
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    return Container(
      width: 46,
      height: 46,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.cardFill,
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

class _WinnerItemData {
  final String name;
  final String subtitle;
  final String amount;
  final String time;
  final String imagePath;
  final bool isSelected;

  const _WinnerItemData({
    required this.name,
    required this.subtitle,
    required this.amount,
    required this.time,
    required this.imagePath,
    this.isSelected = false,
  });
}