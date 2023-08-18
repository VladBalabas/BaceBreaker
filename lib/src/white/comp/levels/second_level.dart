import 'package:flutter/material.dart';

class SecondLevel {
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
    [firstBrickX, firstBrickY, false, Color.fromARGB(255, 67, 251, 0)],
    [firstBrickX + 1 * (brickWidth + brickGap), firstBrickY, false,Color.fromARGB(255, 67, 251, 0)],
    [firstBrickX + 2 * (brickWidth + brickGap), firstBrickY, false, Color.fromARGB(255, 67, 251, 0)],
    [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY, false, Color.fromARGB(255, 67, 251, 0)],
    
    [firstBrickX, firstBrickY + brickHeight / 2 + brickGap, false, Color.fromARGB(255, 23, 6, 211)],
    [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY + brickHeight / 2 + brickGap, false, Color.fromARGB(255, 23, 6, 211)],

    [firstBrickX, firstBrickY + 2* (brickHeight / 2 + brickGap), false, Color.fromARGB(255, 255, 0, 0)],
    [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY + 2* (brickHeight / 2 + brickGap), false, Color.fromARGB(255, 255, 0, 0)],

    [firstBrickX, firstBrickY + 3* (brickHeight / 2 + brickGap), false, Color.fromARGB(255, 243, 2, 218)],
    [firstBrickX + 1 * (brickWidth + brickGap), firstBrickY + 3* (brickHeight / 2 + brickGap), false,Color.fromARGB(255, 243, 2, 218)],
    [firstBrickX + 2 * (brickWidth + brickGap), firstBrickY + 3* (brickHeight / 2 + brickGap), false,Color.fromARGB(255, 243, 2, 218)],
    [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY + 3* (brickHeight / 2 + brickGap), false,Color.fromARGB(255, 243, 2, 218)],
  ];
}