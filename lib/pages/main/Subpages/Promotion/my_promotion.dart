import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';
import '../ScreenHeader/screen_header.dart';
import 'components/active_promotions_section.dart';

class MyPromotionPage extends StatelessWidget {
  const MyPromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ScreenHeader(
            title: 'My Promotions',
            balance: '\$1566',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(bottom: 28),
                child: Column(
                  children: [
                    ActivePromotionsSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}