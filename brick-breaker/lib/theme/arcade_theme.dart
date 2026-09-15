import 'package:flutter/material.dart';

import 'arcade_colors.dart';

abstract final class ArcadeTheme {
  static ThemeData get dark {
    const textTheme = TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 22,
        color: ArcadeColors.cyan,
        height: 1.4,
      ),
      titleLarge: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 16,
        color: ArcadeColors.cyan,
        height: 1.5,
      ),
      titleMedium: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 12,
        color: ArcadeColors.white,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 10,
        color: ArcadeColors.white,
        height: 1.6,
      ),
      bodySmall: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 8,
        color: ArcadeColors.muted,
        height: 1.6,
      ),
      labelLarge: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 11,
        color: ArcadeColors.white,
      ),
    );

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ArcadeColors.background,
      colorScheme: const ColorScheme.dark(
        primary: ArcadeColors.cyan,
        secondary: ArcadeColors.pink,
        surface: ArcadeColors.background,
      ),
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ArcadeColors.cyan,
      ),
      useMaterial3: true,
    );
  }
}
