part of '../../tetris.dart';

/*
I Block
= = = =
*/
class ITetromino extends Tetromino {
  ITetromino(super.tiles, super.axisOfRotationTile, super.color,
      {required int width}) {
    final int axisX = width ~/ 2;
    final int axisY = -1;
    tiles[0] = Tile(axisX - 1, axisY);
    tiles[1] = Tile(axisX, axisY);
    tiles[2] = Tile(axisX + 1, axisY);
    tiles[3] = Tile(axisX + 2, axisY);

    axisOfRotationTile = tiles[1];

    color = 'cyan';
  }
}

/*
O Block
= =
= =
*/
class OTetromino extends Tetromino {
  OTetromino(super.tiles, super.axisOfRotationTile, super.color,
      {required int width}) {
    final int axisX = width ~/ 2;
    final int axisY = -1;

    tiles[0] = Tile(axisX, axisY);
    tiles[1] = Tile(axisX + 1, axisY);
    tiles[2] = Tile(axisX, axisY + 1);
    tiles[3] = Tile(axisX + 1, axisY + 1);

    axisOfRotationTile = tiles[1];

    color = 'yellow';
  }
}

/*
J Block
=
= = =
*/
class JTetromino extends Tetromino {
  JTetromino(super.tiles, super.axisOfRotationTile, super.color,
      {required int width}) {
    final int axisX = width ~/ 2;
    final int axisY = 0;

    tiles[0] = Tile(axisX - 1, axisY);
    tiles[1] = Tile(axisX, axisY);
    tiles[2] = Tile(axisX + 1, axisY);
    tiles[3] = Tile(axisX - 1, axisY - 1);

    axisOfRotationTile = tiles[1];

    color = 'blue';
  }
}

/*
L Block
    =
= = =
*/
class LTetromino extends Tetromino {
  LTetromino(super.tiles, super.axisOfRotationTile, super.color,
      {required int width}) {
    final int axisX = width ~/ 2;
    final int axisY = 0;

    tiles[0] = Tile(axisX - 1, axisY);
    tiles[1] = Tile(axisX, axisY);
    tiles[2] = Tile(axisX + 1, axisY);
    tiles[3] = Tile(axisX + 1, axisY - 1);

    axisOfRotationTile = tiles[1];

    color = 'orange';
  }
}

/*
T Block
    =
= = =
*/
class TTetromino extends Tetromino {
  TTetromino(super.tiles, super.axisOfRotationTile, super.color,
      {required int width}) {
    final int axisX = width ~/ 2;
    final int axisY = 0;

    tiles[0] = Tile(axisX - 1, axisY);
    tiles[1] = Tile(axisX, axisY);
    tiles[2] = Tile(axisX + 1, axisY);
    tiles[3] = Tile(axisX, axisY - 1);

    axisOfRotationTile = tiles[1];

    color = 'purple';
  }
}

/*
Z Block
= =
  = =
*/
class ZTetromino extends Tetromino {
  ZTetromino(super.tiles, super.axisOfRotationTile, super.color,
      {required int width}) {
    final int axisX = width ~/ 2;
    final int axisY = 0;

    tiles[0] = Tile(axisX - 1, axisY - 1);
    tiles[1] = Tile(axisX, axisY - 1);
    tiles[2] = Tile(axisX, axisY);
    tiles[3] = Tile(axisX + 1, axisY);

    axisOfRotationTile = tiles[1];

    color = 'red';
  }
}

/*
S Block
  = =
= =
*/
class STetromino extends Tetromino {
  STetromino(super.tiles, super.axisOfRotationTile, super.color,
      {required int width}) {
    final int axisX = width ~/ 2;
    final int axisY = 0;

    tiles[0] = Tile(axisX - 1, axisY);
    tiles[1] = Tile(axisX, axisY);
    tiles[2] = Tile(axisX, axisY - 1);
    tiles[3] = Tile(axisX + 1, axisY - 1);

    axisOfRotationTile = tiles[1];

    color = 'green';
  }
}
