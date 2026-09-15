import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game/levels/level_walls.dart';
import '../settings/game_settings.dart';
import '../theme/arcade_colors.dart';
import '../widgets/arcade_button.dart';
import '../widgets/brick_backdrop.dart';
import 'level_preview_screen.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<GameSettings>();

    return Scaffold(
      body: BrickBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const BackLink(),
                const SizedBox(height: 8),
                Text(
                  'SELECIONAR\nNÍVEL',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: LevelInfo.all.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final info = LevelInfo.all[index];
                      final stars = settings.starsByLevel[info.number] ?? 0;
                      final color = Color(info.accentValue);
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => LevelPreviewScreen(level: info.number),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.45),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: color, width: 1.6),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: color),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '${info.number}',
                                  style: TextStyle(
                                    fontFamily: 'PressStart2P',
                                    fontSize: 16,
                                    color: color,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      info.name,
                                      style: TextStyle(
                                        fontFamily: 'PressStart2P',
                                        fontSize: 11,
                                        color: color,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: List.generate(3, (i) {
                                        return Icon(
                                          i < stars
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: ArcadeColors.yellow,
                                          size: 16,
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.play_arrow_rounded, color: color),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: ArcadeColors.cyan),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.emoji_events, color: ArcadeColors.pink),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'MELHOR PONTUAÇÃO',
                            style: TextStyle(
                              fontFamily: 'PressStart2P',
                              fontSize: 8,
                              color: ArcadeColors.cyan,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${settings.bestScore} PTS',
                            style: const TextStyle(
                              fontFamily: 'PressStart2P',
                              fontSize: 12,
                              color: ArcadeColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
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
