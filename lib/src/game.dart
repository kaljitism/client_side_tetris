part of '../../tetris.dart';

class Game {
  CanvasElement? canvas;
  Element? gameScore;
  Tetromino? currentBlock;

  static int width = 30;
  static int height = 60;
  static int cellSize = 10;

  static late int linesCleared;
  static CanvasRenderingContext2D? ctx;

  static late List<List<int>> boardState;
  static late List<int> rowState;

  Game() {
    gameScore = Element()..id = 'GameScore';

    linesCleared = 0;

    boardState = List<List<int>>.generate(
      width,
      (index) => List.filled(height, 0),
    );
    rowState = List<int>.filled(height, 0);
  }

  void getRandomTetromino() {
    final int random = Random().nextInt(7);
    final tetrominoValue = TetrominoBlock.values[random];
    switch (tetrominoValue) {
      case TetrominoBlock.I:
        currentBlock = ITetromino(width: width);
        break;
      case TetrominoBlock.O:
        currentBlock = OTetromino(width: width);
        break;
      case TetrominoBlock.T:
        currentBlock = TTetromino(width: width);
        break;
      case TetrominoBlock.S:
        currentBlock = STetromino(width: width);
        break;
      case TetrominoBlock.Z:
        currentBlock = ZTetromino(width: width);
        break;
      case TetrominoBlock.J:
        currentBlock = JTetromino(width: width);
        break;
      case TetrominoBlock.L:
        currentBlock = LTetromino(width: width);
        break;
      default:
        throw Exception('Invalid Tetromino');
    }
  }

  //
}
