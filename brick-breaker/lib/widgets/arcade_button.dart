import 'package:flutter/material.dart';

import '../theme/arcade_colors.dart';

class ArcadeButton extends StatelessWidget {
  const ArcadeButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = false,
    this.color = ArcadeColors.cyan,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final bool filled;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: filled ? color : Colors.black.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.35),
              blurRadius: 12,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: filled ? Colors.white : color, size: 22),
                  const SizedBox(width: 10),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 11,
                    color: filled ? Colors.white : color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackLink extends StatelessWidget {
  const BackLink({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onTap ?? () => Navigator.of(context).maybePop(),
        child: const Text(
          '← VOLTAR',
          style: TextStyle(
            fontFamily: 'PressStart2P',
            fontSize: 10,
            color: ArcadeColors.cyan,
          ),
        ),
      ),
    );
  }
}
