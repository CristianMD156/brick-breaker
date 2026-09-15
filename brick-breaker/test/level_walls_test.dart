import 'package:flutter_test/flutter_test.dart';

import 'package:brick_breaker/game/levels/level_walls.dart';

void main() {
  test('cada nível tem pelo menos alguns tijolos', () {
    for (var level = 1; level <= 5; level++) {
      expect(LevelWalls.brickCount(level), greaterThan(0));
    }
  });

  test('nível 1 é parede cheia', () {
    expect(LevelWalls.brickCount(1), 40);
  });
}
