import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../settings/game_settings.dart';
import '../theme/arcade_colors.dart';
import '../widgets/arcade_button.dart';
import '../widgets/brick_backdrop.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<GameSettings>();

    return Scaffold(
      body: BrickBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const BackLink(),
                const SizedBox(height: 8),
                Text(
                  'CONFIGURAÇÕES',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 22),
                const _SectionTitle('AUDIO'),
                _ToggleRow(
                  label: 'EFEITOS',
                  value: settings.effectsEnabled,
                  onChanged: settings.setEffects,
                ),
                _ToggleRow(
                  label: 'MÚSICA',
                  value: settings.musicEnabled,
                  onChanged: settings.setMusic,
                ),
                const SizedBox(height: 18),
                const _SectionTitle('JOGO'),
                _ToggleRow(
                  label: 'VIBRAÇÃO',
                  value: settings.vibrationEnabled,
                  onChanged: settings.setVibration,
                ),
                const SizedBox(height: 12),
                const Text(
                  'DIFICULDADE',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 9,
                    color: ArcadeColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: Difficulty.values.map((d) {
                    final selected = settings.difficulty == d;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: GestureDetector(
                          onTap: () => settings.setDifficulty(d),
                          child: Container(
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selected
                                  ? ArcadeColors.cyan
                                  : Colors.black.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: ArcadeColors.cyan),
                            ),
                            child: Text(
                              d.name.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'PressStart2P',
                                fontSize: 7,
                                color: selected
                                    ? ArcadeColors.background
                                    : ArcadeColors.cyan,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Text(
                  'VELOCIDADE  ${settings.speed}/8',
                  style: const TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 9,
                    color: ArcadeColors.cyan,
                  ),
                ),
                Slider(
                  value: settings.speed.toDouble(),
                  min: 1,
                  max: 8,
                  divisions: 7,
                  activeColor: ArcadeColors.cyan,
                  onChanged: (v) => settings.setSpeed(v.round()),
                ),
                const SizedBox(height: 12),
                const _SectionTitle('TIJOLOS'),
                const SizedBox(height: 8),
                const Text(
                  'COR',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 9,
                    color: ArcadeColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _PaletteChip(
                      label: 'CLÁSSICO',
                      selected: settings.brickPalette == 'classico',
                      onTap: () => settings.setPalette('classico'),
                    ),
                    _PaletteChip(
                      label: 'NEON',
                      selected: settings.brickPalette == 'neon',
                      onTap: () => settings.setPalette('neon'),
                    ),
                    _PaletteChip(
                      label: 'GELO',
                      selected: settings.brickPalette == 'gelo',
                      onTap: () => settings.setPalette('gelo'),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Text(
                  'TAMANHO',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 9,
                    color: ArcadeColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: BrickSize.values.map((size) {
                    final selected = settings.brickSize == size;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: GestureDetector(
                          onTap: () => settings.setBrickSize(size),
                          child: Container(
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selected
                                  ? ArcadeColors.pink
                                  : Colors.black.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: ArcadeColors.pink),
                            ),
                            child: Text(
                              size.name.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'PressStart2P',
                                fontSize: 7,
                                color: selected
                                    ? ArcadeColors.white
                                    : ArcadeColors.pink,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),
                ArcadeButton(
                  label: 'RESTAURAR PADRÕES',
                  color: ArcadeColors.pink,
                  onPressed: settings.restoreDefaults,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 10,
        color: ArcadeColors.pink,
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'PressStart2P',
          fontSize: 9,
          color: ArcadeColors.white,
        ),
      ),
      value: value,
      activeThumbColor: ArcadeColors.cyan,
      onChanged: onChanged,
    );
  }
}

class _PaletteChip extends StatelessWidget {
  const _PaletteChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? ArcadeColors.cyan.withValues(alpha: 0.25)
              : Colors.black.withValues(alpha: 0.4),
          border: Border.all(color: ArcadeColors.cyan),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'PressStart2P',
            fontSize: 8,
            color: ArcadeColors.cyan,
          ),
        ),
      ),
    );
  }
}
