part of '../../tetris.dart';

class Game {
  late CanvasElement board;
  late Element gameScore;
  late Tetromino currentTetromino;

  static late int width;
  static late int height;
  static late int cellSize;

  static late int linesCleared;
  static late CanvasRenderingContext2D ctx;

  static late List<List<int>> boardState;
  static late List<int> rowState;

  Game() {
    gameScore = Element()..id = 'GameScore';

    width = 30;
    height = 60;
    cellSize = 10;

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
        currentTetromino = ITetromino(width: width);
        break;
      case TetrominoBlock.O:
        currentTetromino = OTetromino(width: width);
        break;
      case TetrominoBlock.T:
        currentTetromino = TTetromino(width: width);
        break;
      case TetrominoBlock.S:
        currentTetromino = STetromino(width: width);
        break;
      case TetrominoBlock.Z:
        currentTetromino = ZTetromino(width: width);
        break;
      case TetrominoBlock.J:
        currentTetromino = JTetromino(width: width);
        break;
      case TetrominoBlock.L:
        currentTetromino = LTetromino(width: width);
        break;
      default:
        throw Exception('Invalid Tetromino');
    }
  }

  void clearRows() {
    for (int index = 0; index < rowState.length; index++) {
      if (rowState[index] == width) {
        ImageData imageData =
            ctx.getImageData(0, 0, cellSize * width, cellSize * index);
        ctx.putImageData(imageData, 0, cellSize);

        for (int y = index; y > 0; y--) {
          for (int x = 0; x < width; x++) {
            boardState[x][y] = boardState[x][y - 1];
          }
          rowState[y] = rowState[y - 1];
        }
        rowState[0] = 0;
        boardState.asMap().forEach((index, element) => element[0] = 0);
        linesCleared++;
      }
    }
  }

  bool validMove() {
    for (Tile tile in currentTetromino.tiles) {
      if (tile.x < 0 || tile.y < 0 || tile.x >= width || tile.y >= height) {
        return false;
      }
    }
    return true;
  }

  bool movePiece(Movement movement) {
    bool isMoving = true;
    ctx.fillStyle = 'grey' as JSAny;
    currentTetromino.tiles.asMap().forEach((_, Tile tile) {
      ctx.fillRect(tile.x * cellSize, tile.y * cellSize, cellSize, cellSize);
    });
    if (movement == Movement.rotate) {
      currentTetromino.rotateRight();
    } else {
      currentTetromino.move(Movement.down);
    }

    if (!(isMoving == validMove())) {
      if (movement == Movement.rotate) currentTetromino.rotateLeft();
      if (movement == Movement.down) currentTetromino.move(Movement.up);
      if (movement == Movement.up) currentTetromino.move(Movement.down);
      if (movement == Movement.left) currentTetromino.move(Movement.right);
      if (movement == Movement.right) currentTetromino.move(Movement.left);
    }

    ctx.fillStyle = currentTetromino.color as JSAny;
    currentTetromino.tiles.asMap().forEach((_, Tile tile) {
      ctx.fillRect(tile.x * cellSize, tile.y * cellSize, cellSize, cellSize);
    });
    return isMoving;
  }

  void gameLoop(Timer timer) {
    gameScore.setHTML("<p>Score: $linesCleared Lines</p>");
    if (!movePiece(Movement.down)) {
      currentTetromino.tiles.asMap().forEach((_, Tile tile) {
        boardState[tile.x][tile.y] = 1;
        rowState[tile.y]++;
      });
      clearRows();
      getRandomTetromino();
      if (!movePiece(Movement.down)) {
        timer.cancel();
        window.alert('Game Over');
      }
    }
  }

  void initializeCanvas() {
    board = CanvasElement();
    board.width = cellSize * width;
    board.height = cellSize * height;

    ctx = board.context2D;

    ctx.fillStyle = 'grey' as JSAny;
    ctx.fillRect(0, 0, board.width, board.height);
  }
}
