import 'package:flutter/material.dart';

import '../theme/arcade_colors.dart';
import '../widgets/arcade_button.dart';
import '../widgets/brick_backdrop.dart';
import 'game_screen.dart';
import 'home_screen.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({
    super.key,
    required this.score,
    required this.level,
  });

  final int score;
  final int level;

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
                const Text(
                  'GAME OVER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 22,
                    color: ArcadeColors.pink,
                    shadows: [Shadow(color: ArcadeColors.pink, blurRadius: 18)],
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'PONTUAÇÃO FINAL',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 9,
                    color: ArcadeColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  score.toString().padLeft(5, '0'),
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 28,
                    color: ArcadeColors.cyan,
                  ),
                ),
                const Spacer(),
                ArcadeButton(
                  label: 'TENTAR NOVAMENTE',
                  icon: Icons.refresh,
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => GameScreen(level: level),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ArcadeButton(
                  label: 'MENU',
                  icon: Icons.arrow_back,
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
