import 'package:flutter/material.dart';

import '../theme/arcade_colors.dart';
import '../widgets/arcade_button.dart';
import '../widgets/brick_backdrop.dart';
import 'settings_screen.dart';
import 'team_screen.dart';
import 'level_select_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  'BRICK\nBREAKER',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        shadows: const [
                          Shadow(color: ArcadeColors.cyan, blurRadius: 18),
                        ],
                      ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '+ Arcade Edition +',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 10,
                    color: ArcadeColors.pink,
                  ),
                ),
                const SizedBox(height: 28),
                const _MiniPreview(),
                const Spacer(),
                ArcadeButton(
                  label: 'JOGAR',
                  filled: true,
                  color: ArcadeColors.pink,
                  icon: Icons.play_arrow_rounded,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const LevelSelectScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ArcadeButton(
                  label: 'INTEGRANTES',
                  icon: Icons.groups_outlined,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const TeamScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ArcadeButton(
                  label: 'CONFIGURAÇÕES',
                  icon: Icons.settings_outlined,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const SettingsScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Versão 1.0',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 8,
                    color: ArcadeColors.muted,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  '© 2026 BRICK BREAKER TEAM',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 7,
                    color: ArcadeColors.muted,
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

class _MiniPreview extends StatelessWidget {
  const _MiniPreview();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Column(
        children: [
          const Icon(Icons.circle, color: ArcadeColors.cyan, size: 14),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TinyBrick(ArcadeColors.pink),
              _TinyBrick(ArcadeColors.yellow),
              _TinyBrick(ArcadeColors.cyan),
            ],
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TinyBrick(ArcadeColors.yellow),
              _TinyBrick(ArcadeColors.pink),
              _TinyBrick(ArcadeColors.cyan),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: 72,
            height: 10,
            decoration: BoxDecoration(
              color: ArcadeColors.cyan,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(color: ArcadeColors.cyan, blurRadius: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TinyBrick extends StatelessWidget {
  const _TinyBrick(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
