part of '../../tetris.dart';

class Game {
  CanvasElement? canvas;
  Element? score;
  Tetromino? currentBlock;

  static int width = 30;
  static int height = 60;
  static int cellSize = 10;

  static int? linesCleared;
  static CanvasRenderingContext2D? ctx;

  static List<List<int?>?>? boardState;
  static List<int?>? rowState;
}
