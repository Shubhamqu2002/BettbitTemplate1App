import 'package:flutter/material.dart';
import '../../components/bottomtab/bottom_tab.dart';
import '../../components/header/header.dart';
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

  late final List<Widget> _pages = const [
    HomeTabPage(),
    LiveTabPage(),
    WalletTabPage(),
    ProfileTabPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true, // 👈 important (remove bottom gap)
      body: Column(
        children: [
          Header(
            onMenuTap: () {
              debugPrint('Menu clicked');
            },
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
        isScrolling: _isScrolling, // 👈 pass state
        onTabChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        onSearchTap: () {
          debugPrint('Search tapped');
        },
      ),
    );
  }
}