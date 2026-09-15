import 'package:flutter/material.dart';

abstract final class ArcadeColors {
  static const Color background = Color(0xFF07080F);
  static const Color brickTint = Color(0xFF10162A);
  static const Color cyan = Color(0xFF00F5FF);
  static const Color pink = Color(0xFFFF2D95);
  static const Color yellow = Color(0xFFFFE14A);
  static const Color orange = Color(0xFFFF7A18);
  static const Color purple = Color(0xFFB44CFF);
  static const Color green = Color(0xFF3CFF9A);
  static const Color white = Color(0xFFF4F7FF);
  static const Color muted = Color(0xFF8B93B0);

  static const List<Color> brickPaletteClassic = [
    Color(0xFFFF3B6B),
    Color(0xFFFF7A18),
    Color(0xFFFFE14A),
    Color(0xFF3CFF9A),
    Color(0xFF00F5FF),
    Color(0xFFB44CFF),
  ];

  static const List<Color> brickPaletteNeon = [
    Color(0xFFFF2D95),
    Color(0xFF00F5FF),
    Color(0xFFFFE14A),
    Color(0xFFB44CFF),
    Color(0xFF3CFF9A),
  ];

  static const List<Color> brickPaletteIce = [
    Color(0xFF8BE9FF),
    Color(0xFF4CC9FF),
    Color(0xFF00F5FF),
    Color(0xFF7A8CFF),
    Color(0xFFE0F7FF),
  ];

  static List<Color> paletteByName(String name) {
    switch (name) {
      case 'neon':
        return brickPaletteNeon;
      case 'gelo':
        return brickPaletteIce;
      default:
        return brickPaletteClassic;
    }
  }
}
