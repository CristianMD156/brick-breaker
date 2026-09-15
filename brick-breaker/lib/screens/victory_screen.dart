import 'package:flutter/material.dart';

import '../theme/arcade_colors.dart';
import '../widgets/arcade_button.dart';
import '../widgets/brick_backdrop.dart';
import 'home_screen.dart';
import 'level_select_screen.dart';

class VictoryScreen extends StatelessWidget {
  const VictoryScreen({super.key, required this.score});

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
                const Text(
                  'VITÓRIA',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 26,
                    color: ArcadeColors.yellow,
                    shadows: [
                      Shadow(color: ArcadeColors.yellow, blurRadius: 18),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'VOCÊ QUEBROU\nTODAS AS PAREDES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 10,
                    color: ArcadeColors.white,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 28),
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
                  label: 'JOGAR DE NOVO',
                  filled: true,
                  color: ArcadeColors.pink,
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const LevelSelectScreen(),
                    ),
                    (route) => route.isFirst,
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
