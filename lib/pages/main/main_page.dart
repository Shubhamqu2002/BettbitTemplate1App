import 'package:flutter/material.dart';
import '../../components/bottomtab/bottom_tab.dart';
import '../../components/header/header.dart';
import '../../components/header/hamburger_menu.dart';
import '../../config/colors/app_colors.dart';
import '../auth/auth_page.dart';
import 'tabpages/home_tab_page.dart';
import 'tabpages/live_tab_page.dart';
import 'tabpages/profile_tab_page.dart';
import 'tabpages/wallet_tab_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  bool _isScrolling = false;
  bool _isMenuOpen = false;

  late final List<Widget> _pages = const [
    HomeTabPage(),
    LiveTabPage(),
    WalletTabPage(),
    ProfileTabPage(),
  ];

  void _openMenu() {
    setState(() => _isMenuOpen = true);
  }

  void _closeMenu() {
    setState(() => _isMenuOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.background,
          extendBody: true,
          body: Column(
            children: [
              Header(
                onMenuTap: _openMenu,
                onLoginTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                },
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollStartNotification ||
                        notification is ScrollUpdateNotification) {
                      if (!_isScrolling) {
                        setState(() => _isScrolling = true);
                      }
                    }

                    if (notification is ScrollEndNotification) {
                      setState(() => _isScrolling = false);
                    }

                    return false;
                  },
                  child: IndexedStack(
                    index: _currentIndex,
                    children: _pages,
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomTab(
            currentIndex: _currentIndex,
            isScrolling: _isScrolling,
            onTabChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onSearchTap: () {
              debugPrint('Search tapped');
            },
          ),
        ),

        if (_isMenuOpen)
          HamburgerMenu(
            onClose: _closeMenu,
          ),
      ],
    );
  }
}