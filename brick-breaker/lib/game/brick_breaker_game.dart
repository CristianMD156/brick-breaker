import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../settings/game_settings.dart';
import '../theme/arcade_colors.dart';
import 'audio/game_audio.dart';
import 'components/ball.dart';
import 'components/brick.dart';
import 'components/paddle.dart';
import 'levels/level_walls.dart';

enum PlayState { ready, playing, won, lost }

class BrickBreakerGame extends FlameGame
    with HasCollisionDetection, MultiTouchDragDetector, MultiTouchTapDetector {
  BrickBreakerGame({
    required this.settings,
    required this.level,
    required this.startingScore,
    required this.onHudChanged,
    required this.onFinished,
  });

  final GameSettings settings;
  final int level;
  final int startingScore;
  final VoidCallback onHudChanged;
  final void Function({required bool won, required int score, required int lives})
      onFinished;

  late final GameAudio audio;
  late Paddle paddle;
  late Ball ball;

  int score = 0;
  late int lives;
  int remainingBricks = 0;
  PlayState playState = PlayState.ready;
  bool _ending = false;

  @override
  Color backgroundColor() => ArcadeColors.background;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;

    audio = GameAudio(settings);
    await audio.load();

    score = startingScore;
    lives = settings.lives;

    _buildLevel();
    onHudChanged();
  }

  void _buildLevel() {
    world.removeAll(world.children.toList());

    final matrix = LevelWalls.matrixFor(level);
    final palette = ArcadeColors.paletteByName(settings.brickPalette);
    final gap = 6.0;
    final sidePad = 16.0;
    final available = size.x - sidePad * 2;
    final brickW =
        ((available - gap * (LevelWalls.columns - 1)) / LevelWalls.columns) *
            settings.brickScale.clamp(0.75, 1.15);
    final brickH = 22.0 * settings.brickScale;
    final totalW =
        brickW * LevelWalls.columns + gap * (LevelWalls.columns - 1);
    final startX = (size.x - totalW) / 2;
    const startY = 78.0;

    remainingBricks = 0;
    for (var r = 0; r < matrix.length; r++) {
      for (var c = 0; c < matrix[r].length; c++) {
        if (matrix[r][c] != 1) continue;
        remainingBricks++;
        world.add(
          BrickBlock(
            position: Vector2(
              startX + c * (brickW + gap),
              startY + r * (brickH + gap),
            ),
            size: Vector2(brickW, brickH),
            row: r,
            points: (5 - r) * 10,
            color: palette[r % palette.length],
          ),
        );
      }
    }

    paddle = Paddle(playWidth: size.x * 0.28 * settings.paddleWidthFactor)
      ..position = Vector2(size.x / 2, size.y - 48);
    world.add(paddle);

    ball = Ball(speed: 280 * settings.ballSpeedFactor);
    world.add(ball);
    ball.restOnPaddle(paddle.position);
    playState = PlayState.ready;
    _ending = false;
  }

  @override
  void onDragUpdate(int pointerId, DragUpdateInfo info) {
    final x = info.eventPosition.widget.x.clamp(
      paddle.size.x / 2,
      size.x - paddle.size.x / 2,
    );
    paddle.position.x = x;
    if (!ball.launched) {
      ball.restOnPaddle(paddle.position);
    }
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    if (playState == PlayState.ready) {
      playState = PlayState.playing;
      ball.launch();
      onHudChanged();
    }
  }

  void onBrickHit(BrickBlock brick) {
    brick.removeFromParent();
    remainingBricks--;
    score += brick.points;
    audio.brick();
    audio.vibrate();
    onHudChanged();
    if (remainingBricks <= 0) {
      _finish(won: true);
    }
  }

  void onBallLost() {
    if (_ending) return;
    lives--;
    audio.loseLife();
    onHudChanged();
    if (lives <= 0) {
      _finish(won: false);
      return;
    }
    ball.restOnPaddle(paddle.position);
    playState = PlayState.ready;
    onHudChanged();
  }

  void _finish({required bool won}) {
    if (_ending) return;
    _ending = true;
    playState = won ? PlayState.won : PlayState.lost;
    if (won) {
      audio.win();
    }
    onFinished(won: won, score: score, lives: lives);
  }
}
