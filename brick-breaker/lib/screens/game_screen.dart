import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game/brick_breaker_game.dart';
import '../settings/game_settings.dart';
import '../theme/arcade_colors.dart';
import 'game_over_screen.dart';
import 'level_complete_screen.dart';
import 'victory_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.level,
    this.startingScore = 0,
  });

  final int level;
  final int startingScore;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late BrickBreakerGame game;
  int score = 0;
  int lives = 0;
  int bricks = 0;

  @override
  void initState() {
    super.initState();
    final settings = context.read<GameSettings>();
    score = widget.startingScore;
    lives = settings.lives;
    game = BrickBreakerGame(
      settings: settings,
      level: widget.level,
      startingScore: widget.startingScore,
      onHudChanged: () {
        if (!mounted) return;
        setState(() {
          score = game.score;
          lives = game.lives;
          bricks = game.remainingBricks;
        });
      },
      onFinished: ({required won, required score, required lives}) {
        if (!mounted) return;
        final settings = context.read<GameSettings>();
        settings.recordScore(score);
        if (won) {
          final stars = lives >= 3 ? 3 : (lives == 2 ? 2 : 1);
          settings.recordStars(widget.level, stars);
          if (widget.level >= 5) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (_) => VictoryScreen(score: score),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (_) => LevelCompleteScreen(
                  level: widget.level,
                  score: score,
                ),
              ),
            );
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (_) => GameOverScreen(
                score: score,
                level: widget.level,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ArcadeColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 12, 4),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      '← VOLTAR',
                      style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 8,
                        color: ArcadeColors.cyan,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'NÍVEL ${widget.level}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 10,
                        color: ArcadeColors.pink,
                      ),
                    ),
                  ),
                  Text(
                    '$score',
                    style: const TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 10,
                      color: ArcadeColors.cyan,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'VIDAS ${'♥' * lives}',
                    style: const TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 8,
                      color: ArcadeColors.pink,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    game.playState == PlayState.ready
                        ? 'TOQUE PARA LANÇAR'
                        : 'TIJOLOS $bricks',
                    style: const TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 8,
                      color: ArcadeColors.muted,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Expanded(child: GameWidget(game: game)),
          ],
        ),
      ),
    );
  }
}
