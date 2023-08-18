

import 'package:flutter/material.dart';

class ThirdLevel {
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
    [firstBrickX, firstBrickY, false,const Color(0xFF9DAD6F)],
    [firstBrickX + 2 * (brickWidth + brickGap), firstBrickY, false,const Color(0xFF9DAD6F)],
    
    [firstBrickX + 1 * (brickWidth + brickGap), firstBrickY + brickHeight / 2 + brickGap, false,const Color(0xFFBCD979)],
    [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY + brickHeight / 2 + brickGap, false,const Color(0xFFBCD979)],

    [firstBrickX, firstBrickY + 2* (brickHeight / 2 + brickGap), false,const Color(0xFFA50104)],
    [firstBrickX + 2 * (brickWidth + brickGap), firstBrickY + 2* (brickHeight / 2 + brickGap), false,const Color(0xFFA50104)],

    [firstBrickX + 1 * (brickWidth + brickGap), firstBrickY + 3* (brickHeight / 2 + brickGap), false, const Color(0xFF4794BD)],
    [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY + 3* (brickHeight / 2 + brickGap), false, const Color(0xFF4794BD)],

    [firstBrickX, firstBrickY + 4* (brickHeight / 2 + brickGap), false, const Color(0xFFFCB9B2)],
    [firstBrickX + 2 * (brickWidth + brickGap), firstBrickY + 4* (brickHeight / 2 + brickGap), false,const Color(0xFFFCB9B2)],
  ];
}