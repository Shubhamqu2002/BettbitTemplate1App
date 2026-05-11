import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../../config/colors/app_colors.dart';

class GameTypeDistributionChart extends StatelessWidget {
  const GameTypeDistributionChart({super.key});

  static const Color _slotsColor = Color(0xFFD63FEA);
  static const Color _casinoColor = AppColors.jackpotYellow;
  static const Color _tableColor = Color(0xFFFF4444);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
        decoration: BoxDecoration(
          color: AppColors.walletCardBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.walletCardBorder,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              'GAME TYPE DISTRIBUTION',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.jackpotYellow,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 205,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    left: 7,
                    top: 16,
                    child: _ChartLabel(
                      title: 'Live\nCasino 30%',
                      color: _casinoColor,
                      alignRight: true,
                    ),
                  ),
                  const Positioned(
                    left: 17,
                    bottom: 18,
                    child: _ChartLabel(
                      title: 'Table\nGame 10%',
                      color: _tableColor,
                      alignRight: true,
                    ),
                  ),
                  const Positioned(
                    right: 6,
                    top: 62,
                    child: _ChartLabel(
                      title: 'Slots 60%',
                      color: _slotsColor,
                    ),
                  ),

                  /// ✅ Shifted slightly left from 94 to 84
                  /// This keeps chart centered better between left/right labels.
                  Positioned(
                    left: 84,
                    top: 0,
                    child: CustomPaint(
                      size: const Size(200, 200),
                      painter: _PieChartPainter(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PieChartPainter extends CustomPainter {
  static const Color slotsColor = Color(0xFFD63FEA);
  static const Color casinoColor = AppColors.jackpotYellow;
  static const Color tableColor = Color(0xFFFF4444);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    const startAngle = -math.pi / 2;

    paint.color = slotsColor;
    canvas.drawArc(
      rect,
      startAngle,
      math.pi * 2 * 0.60,
      true,
      paint,
    );

    paint.color = tableColor;
    canvas.drawArc(
      rect,
      startAngle + math.pi * 2 * 0.60,
      math.pi * 2 * 0.10,
      true,
      paint,
    );

    paint.color = casinoColor;
    canvas.drawArc(
      rect,
      startAngle + math.pi * 2 * 0.70,
      math.pi * 2 * 0.30,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ChartLabel extends StatelessWidget {
  final String title;
  final Color color;
  final bool alignRight;

  const _ChartLabel({
    required this.title,
    required this.color,
    this.alignRight = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      title,
      textAlign: alignRight ? TextAlign.right : TextAlign.left,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.25,
      ),
    );

    final colorBox = Container(
      width: 12,
      height: 12,
      color: color,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: alignRight
          ? [
              labelText,
              const SizedBox(width: 7),
              colorBox,
            ]
          : [
              colorBox,
              const SizedBox(width: 7),
              labelText,
            ],
    );
  }
}