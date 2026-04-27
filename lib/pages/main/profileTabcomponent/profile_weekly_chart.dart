import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class ProfileWeeklyChart extends StatelessWidget {
  const ProfileWeeklyChart({super.key});

  static const List<double> _values = [200, -85, 430, 280, 570, -85];
  static const List<String> _labels = [
    'week 1',
    'week 2',
    'week 3',
    'week 4',
    'week 5',
    'week 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 290,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(6, 12, 6, 8),
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: CustomPaint(
          painter: _WeeklyBarChartPainter(
            values: _values,
            labels: _labels,
          ),
        ),
      ),
    );
  }
}

class _WeeklyBarChartPainter extends CustomPainter {
  final List<double> values;
  final List<String> labels;

  const _WeeklyBarChartPainter({
    required this.values,
    required this.labels,
  });

  static const double _minY = -150;
  static const double _maxY = 600;

  @override
  void paint(Canvas canvas, Size size) {
    final leftPadding = 56.0;
    final rightPadding = 10.0;
    final topPadding = 10.0;
    final bottomPadding = 40.0;

    final chartWidth = size.width - leftPadding - rightPadding;
    final chartHeight = size.height - topPadding - bottomPadding;

    final gridPaint = Paint()
      ..color = AppColors.walletCardBorder.withOpacity(0.6)
      ..strokeWidth = 1;

    final zeroLinePaint = Paint()
      ..color = AppColors.bottomTabInactive
      ..strokeWidth = 1.4;

    final barPaint = Paint()
      ..color = AppColors.searchGradientStart
      ..style = PaintingStyle.fill;

    const yLabels = [600, 450, 300, 150, 0, -150];

    double yToPx(double value) {
      return topPadding + ((_maxY - value) / (_maxY - _minY)) * chartHeight;
    }

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    /// 🔹 Draw Grid Lines + Y Labels
    for (final yValue in yLabels) {
      final y = yToPx(yValue.toDouble());

      final paint = yValue == 0 ? zeroLinePaint : gridPaint;

      canvas.drawLine(
        Offset(leftPadding, y),
        Offset(size.width - rightPadding, y),
        paint,
      );

      textPainter.text = TextSpan(
        text: yValue.toString(),
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      );
      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(6, y - textPainter.height / 2),
      );
    }

    final zeroY = yToPx(0);

    /// 🔥 MAIN FIX: Wider Bars + Better Spacing
    final itemWidth = chartWidth / values.length;

    final barWidth = itemWidth * 0.72; // 🔥 wider bars
    final radius = Radius.circular(barWidth * 0.28); // smoother corners

    /// 🔹 Draw Bars + Labels
    for (int i = 0; i < values.length; i++) {
      final value = values[i];

      final centerX = leftPadding + itemWidth * i + itemWidth / 2;

      final barLeft = centerX - barWidth / 2;
      final barRight = centerX + barWidth / 2;

      final valueY = yToPx(value);

      final rect = value >= 0
          ? Rect.fromLTRB(barLeft, valueY, barRight, zeroY)
          : Rect.fromLTRB(barLeft, zeroY, barRight, valueY);

      final rRect = RRect.fromRectAndCorners(
        rect,
        topLeft: value >= 0 ? radius : Radius.zero,
        topRight: value >= 0 ? radius : Radius.zero,
        bottomLeft: value < 0 ? radius : Radius.zero,
        bottomRight: value < 0 ? radius : Radius.zero,
      );

      canvas.drawRRect(rRect, barPaint);

      /// 🔹 Bottom Labels
      textPainter.text = TextSpan(
        text: labels[i],
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      );
      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(
          centerX - textPainter.width / 2,
          size.height - bottomPadding + 12,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WeeklyBarChartPainter oldDelegate) {
    return oldDelegate.values != values || oldDelegate.labels != labels;
  }
}