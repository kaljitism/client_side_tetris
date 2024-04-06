part of '../../tetris.dart';

class Tetromino {
  late List<Tile> tiles;
  late Tile axisOfRotationTile;
  late String color;

  Tetromino(this.tiles, this.axisOfRotationTile, this.color);

  void move(Direction direction) {
    switch (direction) {
      case Direction.left:
        tiles.asMap().forEach((index, tile) => tile.x--);
        break;
      case Direction.right:
        tiles.asMap().forEach((index, tile) => tile.x++);
        break;
      case Direction.down:
        tiles.asMap().forEach((index, tile) => tile.y++);
        break;
      case Direction.up:
        tiles.asMap().forEach((index, tile) => tile.y--);
    }
  }

  void rotateRight() {
    tiles.asMap().forEach((int index, Tile tile) {
      final int x = tile.x;
      final int y = tile.y;
      final int xDiff = x - axisOfRotationTile.x;
      final int yDiff = y - axisOfRotationTile.y;
      tiles[index] =
          Tile(axisOfRotationTile.x - yDiff, axisOfRotationTile.y + xDiff);
    });
  }

  void rotateLeft() {
    tiles.asMap().forEach((int index, Tile tile) {
      final int x = tile.x;
      final int y = tile.y;
      final int xSum = x + axisOfRotationTile.x;
      final int ySum = y + axisOfRotationTile.y;
      tiles[index] =
          Tile(axisOfRotationTile.x + ySum, axisOfRotationTile.y - xSum);
    });
  }
}
