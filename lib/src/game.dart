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
    switch (TetrominoBlock) {
      case TetrominoBlock.I:
        currentBlock = ITetromino();
        break;
      case TetrominoBlock.O:
        currentBlock = OTetromino();
        break;
      case TetrominoBlock.T:
        currentBlock = TTetromino();
        break;
      case TetrominoBlock.S:
        currentBlock = STetromino();
        break;
      case TetrominoBlock.Z:
        currentBlock = ZTetromino();
        break;
      case TetrominoBlock.J:
        currentBlock = JTetromino();
        break;
      case TetrominoBlock.L:
        currentBlock = LTetromino();
        break;
      default:
        throw Exception('Invalid Tetromino');
    }
  }

  //
}
