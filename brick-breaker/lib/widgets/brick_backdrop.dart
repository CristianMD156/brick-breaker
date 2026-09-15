import 'package:flutter/material.dart';

import '../theme/arcade_colors.dart';

class BrickBackdrop extends StatelessWidget {
  const BrickBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _BrickPainter(),
      child: child,
    );
  }
}

class _BrickPainter extends CustomPainter {
  const _BrickPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = ArcadeColors.background,
    );
    final brickPaint = Paint()
      ..color = ArcadeColors.brickTint.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    const brickW = 42.0;
    const brickH = 18.0;
    for (var row = 0; row < size.height / brickH + 1; row++) {
      final offset = row.isOdd ? brickW / 2 : 0.0;
      for (var x = -brickW; x < size.width + brickW; x += brickW) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x + offset, row * brickH, brickW - 3, brickH - 3),
            const Radius.circular(2),
          ),
          brickPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
