import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BrickBlock extends RectangleComponent with CollisionCallbacks {
  BrickBlock({
    required super.position,
    required super.size,
    required this.row,
    required this.points,
    required Color color,
  }) : super(
          anchor: Anchor.topLeft,
          paint: Paint()..color = color,
        );

  final int row;
  final int points;

  @override
  Future<void> onLoad() async {
    await add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final border = Paint()
      ..color = Colors.white.withValues(alpha: 0.28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    canvas.drawRRect(
      RRect.fromRectAndRadius(size.toRect(), const Radius.circular(3)),
      border,
    );
  }
}
