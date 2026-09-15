import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Difficulty { facil, medio, dificil }

enum BrickSize { pequeno, medio, grande }

class GameSettings extends ChangeNotifier {
  static const _kEffects = 'effects';
  static const _kMusic = 'music';
  static const _kVibration = 'vibration';
  static const _kDifficulty = 'difficulty';
  static const _kSpeed = 'speed';
  static const _kPalette = 'palette';
  static const _kBrickSize = 'brickSize';
  static const _kBestScore = 'bestScore';
  static const _kStarsPrefix = 'stars_';

  bool effectsEnabled = true;
  bool musicEnabled = true;
  bool vibrationEnabled = true;
  Difficulty difficulty = Difficulty.medio;
  int speed = 3;
  String brickPalette = 'classico';
  BrickSize brickSize = BrickSize.medio;
  int bestScore = 0;
  final Map<int, int> starsByLevel = {};

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    effectsEnabled = prefs.getBool(_kEffects) ?? true;
    musicEnabled = prefs.getBool(_kMusic) ?? true;
    vibrationEnabled = prefs.getBool(_kVibration) ?? true;
    difficulty = Difficulty.values[prefs.getInt(_kDifficulty) ?? 1];
    speed = prefs.getInt(_kSpeed) ?? 3;
    brickPalette = prefs.getString(_kPalette) ?? 'classico';
    brickSize = BrickSize.values[prefs.getInt(_kBrickSize) ?? 1];
    bestScore = prefs.getInt(_kBestScore) ?? 0;
    for (var i = 1; i <= 5; i++) {
      starsByLevel[i] = prefs.getInt('$_kStarsPrefix$i') ?? 0;
    }
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kEffects, effectsEnabled);
    await prefs.setBool(_kMusic, musicEnabled);
    await prefs.setBool(_kVibration, vibrationEnabled);
    await prefs.setInt(_kDifficulty, difficulty.index);
    await prefs.setInt(_kSpeed, speed);
    await prefs.setString(_kPalette, brickPalette);
    await prefs.setInt(_kBrickSize, brickSize.index);
    await prefs.setInt(_kBestScore, bestScore);
    for (final entry in starsByLevel.entries) {
      await prefs.setInt('$_kStarsPrefix${entry.key}', entry.value);
    }
  }

  void setEffects(bool value) {
    effectsEnabled = value;
    _commit();
  }

  void setMusic(bool value) {
    musicEnabled = value;
    _commit();
  }

  void setVibration(bool value) {
    vibrationEnabled = value;
    _commit();
  }

  void setDifficulty(Difficulty value) {
    difficulty = value;
    _commit();
  }

  void setSpeed(int value) {
    speed = value.clamp(1, 8);
    _commit();
  }

  void setPalette(String value) {
    brickPalette = value;
    _commit();
  }

  void setBrickSize(BrickSize value) {
    brickSize = value;
    _commit();
  }

  Future<void> recordScore(int score) async {
    if (score > bestScore) {
      bestScore = score;
      await _save();
      notifyListeners();
    }
  }

  Future<void> recordStars(int level, int stars) async {
    final current = starsByLevel[level] ?? 0;
    if (stars > current) {
      starsByLevel[level] = stars;
      await _save();
      notifyListeners();
    }
  }

  Future<void> restoreDefaults() async {
    effectsEnabled = true;
    musicEnabled = true;
    vibrationEnabled = true;
    difficulty = Difficulty.medio;
    speed = 3;
    brickPalette = 'classico';
    brickSize = BrickSize.medio;
    await _save();
    notifyListeners();
  }

  int get lives {
    switch (difficulty) {
      case Difficulty.facil:
        return 5;
      case Difficulty.medio:
        return 3;
      case Difficulty.dificil:
        return 2;
    }
  }

  double get ballSpeedFactor {
    final difficultyBoost = switch (difficulty) {
      Difficulty.facil => 0.85,
      Difficulty.medio => 1.0,
      Difficulty.dificil => 1.2,
    };
    return (0.7 + speed * 0.12) * difficultyBoost;
  }

  double get brickScale {
    switch (brickSize) {
      case BrickSize.pequeno:
        return 0.82;
      case BrickSize.medio:
        return 1.0;
      case BrickSize.grande:
        return 1.18;
    }
  }

  double get paddleWidthFactor {
    switch (difficulty) {
      case Difficulty.facil:
        return 1.2;
      case Difficulty.medio:
        return 1.0;
      case Difficulty.dificil:
        return 0.82;
    }
  }

  void _commit() {
    notifyListeners();
    _save();
  }
}
