import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game/levels/level_walls.dart';
import '../settings/game_settings.dart';
import '../theme/arcade_colors.dart';
import '../widgets/arcade_button.dart';
import '../widgets/brick_backdrop.dart';
import 'game_screen.dart';

class LevelPreviewScreen extends StatelessWidget {
  const LevelPreviewScreen({super.key, required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<GameSettings>();
    final info = LevelInfo.all[level - 1];
    final matrix = LevelWalls.matrixFor(level);
    final palette = ArcadeColors.paletteByName(settings.brickPalette);
    final color = Color(info.accentValue);

    return Scaffold(
      body: BrickBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const BackLink(),
                const Text(
                  'BRICK BREAKER',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 14,
                    color: ArcadeColors.cyan,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'NÍVEL ${info.number} – ${info.name}',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 10,
                    color: color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${LevelWalls.brickCount(level)} TIJOLOS',
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 8,
                    color: ArcadeColors.muted,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1.15,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: ArcadeColors.pink),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            for (var r = 0; r < matrix.length; r++)
                              Expanded(
                                child: Row(
                                  children: [
                                    for (var c = 0; c < matrix[r].length; c++)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: matrix[r][c] == 1
                                                  ? palette[r % palette.length]
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _Meter(
                  label: 'VELOCIDADE',
                  filled: settings.speed.clamp(1, 5),
                  color: ArcadeColors.pink,
                ),
                const SizedBox(height: 8),
                _Meter(
                  label: 'PADDLE',
                  filled: settings.difficulty == Difficulty.facil
                      ? 5
                      : settings.difficulty == Difficulty.medio
                          ? 3
                          : 2,
                  color: ArcadeColors.cyan,
                ),
                const SizedBox(height: 20),
                ArcadeButton(
                  label: 'INICIAR FASE',
                  filled: true,
                  color: ArcadeColors.pink,
                  icon: Icons.play_arrow_rounded,
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => GameScreen(level: level),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Meter extends StatelessWidget {
  const _Meter({
    required this.label,
    required this.filled,
    required this.color,
  });

  final String label;
  final int filled;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'PressStart2P',
              fontSize: 8,
              color: ArcadeColors.muted,
            ),
          ),
        ),
        for (var i = 0; i < 5; i++)
          Container(
            width: 22,
            height: 10,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: i < filled ? color : Colors.transparent,
              border: Border.all(color: color),
            ),
          ),
      ],
    );
  }
}
