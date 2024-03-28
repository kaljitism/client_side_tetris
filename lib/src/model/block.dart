part of '../../tetris.dart';

enum Direction { left, right, up, down }

class Block {
  final List<Tile> tiles;
  final Tile rotationTile;
  final String color;

  Block(this.tiles, this.rotationTile, this.color);

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
}
