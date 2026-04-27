import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class FinancialSummaryCard extends StatelessWidget {
  const FinancialSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.walletCardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Financial Summary',
            style: TextStyle(
              color: AppColors.yellowButton,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: SizedBox(
              width: 310,
              height: 250,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 30,
                    top: 0,
                    child: CustomPaint(
                      size: const Size(250, 250),
                      painter: _DonutChartPainter(),
                    ),
                  ),
                  const Positioned(
                    left: 118,
                    top: 92,
                    child: _ChartLabel(
                      color: AppColors.yellowButton,
                      text: '3500',
                    ),
                  ),
                  const Positioned(
                    right: -2,
                    bottom: 16,
                    child: _ChartLabel(
                      color: AppColors.primaryGradientEnd,
                      text: '3500',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const _SummaryItemCard(
            icon: Icons.arrow_downward,
            iconBgColor: AppColors.depositIconBg,
            iconColor: AppColors.primaryGradientEnd,
            title: 'Total Deposits',
            amount: '\$5,000',
            amountColor: AppColors.white,
          ),
          const SizedBox(height: 12),
          const _SummaryItemCard(
            icon: Icons.arrow_upward,
            iconBgColor: AppColors.withdrawIconBg,
            iconColor: AppColors.withdrawButtonBackground,
            title: 'Total Withdrawals',
            amount: '\$3,500',
            amountColor: AppColors.white,
          ),
          const SizedBox(height: 12),
          const _SummaryItemCard(
            icon: Icons.balance,
            iconBgColor: AppColors.netActivityIconBg,
            iconColor: AppColors.yellowButton,
            title: 'Net Activity',
            amount: '\$1,500',
            amountColor: AppColors.primaryGradientEnd,
          ),
        ],
      ),
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 50.0;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final purplePaint = Paint()
      ..color = AppColors.primaryGradientEnd
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true;

    final yellowPaint = Paint()
      ..color = AppColors.yellowButton
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true;

    const startAngle = -math.pi / 2;
    const yellowSweep = -math.pi * 0.60;
    const purpleSweep = math.pi * 2 + yellowSweep;

    canvas.drawArc(
      rect,
      startAngle,
      yellowSweep,
      false,
      yellowPaint,
    );

    canvas.drawArc(
      rect,
      startAngle + yellowSweep,
      -purpleSweep,
      false,
      purplePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ChartLabel extends StatelessWidget {
  final Color color;
  final String text;

  const _ChartLabel({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 7),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 13,
            fontWeight: FontWeight.w800,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _SummaryItemCard extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String amount;
  final Color amountColor;

  const _SummaryItemCard({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: iconColor, size: 21),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.bottomTabInactive,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}