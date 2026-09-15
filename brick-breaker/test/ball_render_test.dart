import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:brick_breaker/game/components/ball.dart';

/// Jogo mínimo usado apenas para montar a [Ball] no loop do Flame.
class _BallTestGame extends FlameGame {
  late final Ball ball;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    ball = Ball(speed: 200);
    await add(ball);
    ball.position = size / 2;
  }
}

void main() {
  testWidgets('a bolinha carrega e desenha sem lançar exceção', (tester) async {
    final game = _BallTestGame();
    await tester.pumpWidget(
      SizedBox(
        width: 400,
        height: 600,
        child: GameWidget(game: game),
      ),
    );
    await tester.pump(); // monta o jogo e desenha o primeiro frame

    expect(game.ball, isNotNull, reason: 'a bolinha deve existir no jogo');
    expect(game.ball.isLoaded, isTrue, reason: 'a bolinha deve estar montada');

    // Sem o `super.onLoad()` no Ball, o CircleComponent fica sem o
    // `_centerOffset` inicializado e o render lança LateInitializationError.
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    game.ball.render(canvas);
    recorder.endRecording();

    expect(tester.takeException(), isNull,
        reason: 'renderizar a bolinha não pode lançar exceção');
  });
}