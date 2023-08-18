
import 'package:flutter/material.dart';

class FirstLevel {
  static double firstBrickX = -1 + wallGap;
  static double firstBrickY = -0.9;
  static double brickWidth = 0.4;
  static double brickHeight = 0.03;
  static double brickGap = 0.03;
  static int numberOfBricksInRow = 4;
  static double wallGap = 0.5 *
      (2 -
          numberOfBricksInRow * brickWidth -
          (numberOfBricksInRow - 1) * brickGap);
  bool brickBroken = false;

  static List<List<dynamic>> get myBricks => [
    //[x, y, bool broken]
    [firstBrickX, firstBrickY, false, const Color(0xFFE1F0C4)],
    [firstBrickX + 1 * (brickWidth + brickGap), firstBrickY, false, const Color(0xFFE1F0C4)],
    [firstBrickX + 2 * (brickWidth + brickGap), firstBrickY, false, const Color(0xFFE1F0C4)],
    [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY, false, const Color(0xFFE1F0C4)],

  ];
}


