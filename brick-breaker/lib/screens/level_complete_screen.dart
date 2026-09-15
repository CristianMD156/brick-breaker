import 'package:flutter/material.dart';

import '../theme/arcade_colors.dart';
import '../widgets/arcade_button.dart';
import '../widgets/brick_backdrop.dart';
import 'game_screen.dart';
import 'home_screen.dart';

class LevelCompleteScreen extends StatelessWidget {
  const LevelCompleteScreen({
    super.key,
    required this.level,
    required this.score,
  });

  final int level;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BrickBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'NÍVEL $level',
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 12,
                    color: ArcadeColors.muted,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'COMPLETO!',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 22,
                    color: ArcadeColors.cyan,
                    shadows: [Shadow(color: ArcadeColors.cyan, blurRadius: 16)],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '$score PTS',
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 16,
                    color: ArcadeColors.yellow,
                  ),
                ),
                const Spacer(),
                ArcadeButton(
                  label: 'PRÓXIMO NÍVEL',
                  filled: true,
                  color: ArcadeColors.pink,
                  icon: Icons.play_arrow_rounded,
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => GameScreen(
                        level: level + 1,
                        startingScore: score,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ArcadeButton(
                  label: 'MENU',
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const HomeScreen(),
                    ),
                    (_) => false,
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
