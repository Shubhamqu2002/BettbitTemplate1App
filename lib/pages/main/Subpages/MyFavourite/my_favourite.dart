import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';
import '../ScreenHeader/screen_header.dart';
import 'components/my_favourite_games_section.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ScreenHeader(
            title: 'My Favourites',
            balance: '\$1566',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: MyFavouriteGamesSection(),
            ),
          ),
        ],
      ),
    );
  }
}