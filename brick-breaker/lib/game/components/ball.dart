import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../brick_breaker_game.dart';
import 'brick.dart';
import 'paddle.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<BrickBreakerGame> {
  Ball({required this.speed})
      : super(
          radius: 8,
          anchor: Anchor.center,
          paint: Paint()
            ..color = const Color(0xFF00F5FF)
            ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 8),
        );

  double speed;
  Vector2 velocity = Vector2.zero();
  bool launched = false;

  void restOnPaddle(Vector2 paddleCenter) {
    launched = false;
    velocity = Vector2.zero();
    position = Vector2(paddleCenter.x, paddleCenter.y - 22);
  }

  void launch() {
    if (launched) return;
    launched = true;
    velocity = Vector2(speed * 0.35, -speed);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!launched) return;

    position += velocity * dt;

    final worldSize = game.size;
    if (position.x - radius <= 0) {
      position.x = radius;
      velocity.x = velocity.x.abs();
      game.audio.wall();
    } else if (position.x + radius >= worldSize.x) {
      position.x = worldSize.x - radius;
      velocity.x = -velocity.x.abs();
      game.audio.wall();
    }

    if (position.y - radius <= 56) {
      position.y = 56 + radius;
      velocity.y = velocity.y.abs();
      game.audio.wall();
    }

    if (position.y - radius > worldSize.y) {
      game.onBallLost();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (!launched) return;

    if (other is Paddle) {
      final hit = (position.x - other.position.x) / (other.size.x / 2);
      velocity.x = speed * hit.clamp(-0.95, 0.95);
      velocity.y = -velocity.y.abs();
      position.y = other.position.y - other.size.y / 2 - radius - 1;
      game.audio.paddle();
      return;
    }

    if (other is BrickBlock) {
      final fromAbove = position.y < other.position.y;
      final fromBelow = position.y > other.position.y + other.size.y;
      if (fromAbove || fromBelow) {
        velocity.y = -velocity.y;
      } else {
        velocity.x = -velocity.x;
      }
      velocity.rotate((Random().nextDouble() - 0.5) * 0.08);
      game.onBrickHit(other);
    }
  }
}
