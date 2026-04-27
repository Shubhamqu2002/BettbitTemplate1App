import 'package:flutter/material.dart';
import '../../config/colors/app_colors.dart';

class HamburgerMenu extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback? onLogoutTap;
  final ValueChanged<MenuItemModel>? onItemTap;

  const HamburgerMenu({
    super.key,
    required this.onClose,
    this.onLogoutTap,
    this.onItemTap,
  });

  static const List<MenuItemModel> _menuItems = [
    MenuItemModel(title: 'Game Analytics', icon: Icons.analytics_rounded),
    MenuItemModel(title: 'My Bets', icon: Icons.view_list_rounded),
    MenuItemModel(title: 'Loyalty tracking', icon: Icons.local_offer_rounded),
    MenuItemModel(title: 'My Promotions', icon: Icons.percent_rounded),
    MenuItemModel(title: 'My Reviews', icon: Icons.rate_review_rounded),
    MenuItemModel(title: 'My Favorites', icon: Icons.favorite_rounded),
    MenuItemModel(title: 'Security', icon: Icons.shield_rounded),
    MenuItemModel(title: 'Settings', icon: Icons.settings_rounded),
    MenuItemModel(title: 'Support', icon: Icons.headset_mic_rounded),
    MenuItemModel(title: 'Terms & Conditions', icon: Icons.description_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final drawerWidth = MediaQuery.sizeOf(context).width * 0.72;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: onClose,
              child: Container(
                color: AppColors.black.withOpacity(0.50),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: drawerWidth,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.menuBackground,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.45),
                    blurRadius: 28,
                    offset: const Offset(8, 0),
                  ),
                ],
              ),
              child: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _MenuHeader(onClose: onClose),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.divider,
                        ),
                        const SizedBox(height: 18),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              for (int i = 0; i < _menuItems.length; i++) ...[
                                _MenuTile(
                                  item: _menuItems[i],
                                  onTap: () => onItemTap?.call(_menuItems[i]),
                                ),
                                if (i != _menuItems.length - 1)
                                  const SizedBox(height: 18),
                              ],

                              /// Balanced gap after Terms & Conditions
                              const SizedBox(height: 28),

                              _LogoutButton(
                                onTap: onLogoutTap ?? onClose,
                              ),
                            ],
                          ),
                        ),
                      ],
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

class _MenuHeader extends StatelessWidget {
  final VoidCallback onClose;

  const _MenuHeader({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 14, 18),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              gradient: AppColors.searchGradient,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.workspace_premium_rounded,
              color: AppColors.white,
              size: 23,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MyCasino',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Premium Member',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.bottomTabInactive,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onClose,
            borderRadius: BorderRadius.circular(20),
            child: const SizedBox(
              width: 36,
              height: 36,
              child: Icon(
                Icons.close_rounded,
                color: AppColors.bottomTabInactive,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final MenuItemModel item;
  final VoidCallback onTap;

  const _MenuTile({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 43,
          child: Row(
            children: [
              SizedBox(
                width: 26,
                child: Icon(
                  item.icon,
                  color: AppColors.searchGradientStart,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutButton({required this.onTap});

  static const Color _logoutColor = Color(0xFFFF0A5B);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: const Icon(
          Icons.logout_rounded,
          size: 18,
          color: _logoutColor,
        ),
        label: const Text(
          'Log Out',
          style: TextStyle(
            color: _logoutColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
        ),
        style: OutlinedButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          backgroundColor: Colors.transparent,
          side: const BorderSide(
            color: _logoutColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }
}

class MenuItemModel {
  final String title;
  final IconData icon;

  const MenuItemModel({
    required this.title,
    required this.icon,
  });
}