import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/services.dart';

import '../../settings/game_settings.dart';

class GameAudio {
  GameAudio(this.settings);

  final GameSettings settings;
  bool _loaded = false;

  Future<void> load() async {
    if (_loaded) return;
    await FlameAudio.audioCache.loadAll([
      'hit_brick.wav',
      'hit_paddle.wav',
      'hit_wall.wav',
      'lose_life.wav',
      'win.wav',
      'click.wav',
    ]);
    _loaded = true;
  }

  Future<void> play(String file) async {
    if (!settings.effectsEnabled) return;
    await FlameAudio.play(file, volume: 0.55);
  }

  Future<void> brick() => play('hit_brick.wav');
  Future<void> paddle() => play('hit_paddle.wav');
  Future<void> wall() => play('hit_wall.wav');
  Future<void> loseLife() => play('lose_life.wav');
  Future<void> win() => play('win.wav');
  Future<void> click() => play('click.wav');

  Future<void> vibrate() async {
    if (!settings.vibrationEnabled) return;
    await HapticFeedback.mediumImpact();
  }
}
