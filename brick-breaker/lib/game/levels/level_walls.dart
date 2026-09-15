/// Paredes de tijolos em matriz (1 = bloco, 0 = vazio).
abstract final class LevelWalls {
  static const int columns = 8;
  static const int rows = 5;

  static List<List<int>> matrixFor(int level) {
    switch (level) {
      case 1:
        return _full;
      case 2:
        return _centerGap;
      case 3:
        return _pyramid;
      case 4:
        return _checker;
      case 5:
        return _mixed;
      default:
        return _full;
    }
  }

  static const List<List<int>> _full = [
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
  ];

  static const List<List<int>> _centerGap = [
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 0, 0, 0, 0, 1, 1],
    [1, 1, 0, 0, 0, 0, 1, 1],
    [1, 1, 0, 0, 0, 0, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
  ];

  static const List<List<int>> _pyramid = [
    [0, 0, 0, 1, 1, 0, 0, 0],
    [0, 0, 1, 1, 1, 1, 0, 0],
    [0, 1, 1, 1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
  ];

  static const List<List<int>> _checker = [
    [1, 0, 1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1, 0],
  ];

  static const List<List<int>> _mixed = [
    [1, 1, 0, 0, 0, 0, 1, 1],
    [1, 0, 1, 1, 1, 1, 0, 1],
    [0, 1, 1, 1, 1, 1, 1, 0],
    [1, 0, 1, 1, 1, 1, 0, 1],
    [1, 1, 0, 0, 0, 0, 1, 1],
  ];

  static int brickCount(int level) {
    var count = 0;
    for (final row in matrixFor(level)) {
      for (final cell in row) {
        if (cell == 1) count++;
      }
    }
    return count;
  }
}

class LevelInfo {
  const LevelInfo({
    required this.number,
    required this.name,
    required this.accentValue,
  });

  final int number;
  final String name;
  final int accentValue;

  static const List<LevelInfo> all = [
    LevelInfo(number: 1, name: 'FÁCIL', accentValue: 0xFF00F5FF),
    LevelInfo(number: 2, name: 'MÉDIO', accentValue: 0xFFFFE14A),
    LevelInfo(number: 3, name: 'DIFÍCIL', accentValue: 0xFFFF7A18),
    LevelInfo(number: 4, name: 'EXTREMO', accentValue: 0xFFFF2D95),
    LevelInfo(number: 5, name: 'MESTRE', accentValue: 0xFFFF3B6B),
  ];
}
