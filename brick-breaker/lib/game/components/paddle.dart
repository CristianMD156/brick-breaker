import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Paddle extends RectangleComponent with CollisionCallbacks {
  Paddle({required this.playWidth})
      : super(
          size: Vector2(playWidth, 16),
          paint: Paint()
            ..color = const Color(0xFF00F5FF)
            ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 6),
          anchor: Anchor.center,
        );

  final double playWidth;

  @override
  Future<void> onLoad() async {
    await add(RectangleHitbox());
  }
}
