import 'dart:async';

import 'package:bace_breaker/src/white/comp/coverscreen.dart';
import 'package:bace_breaker/src/white/comp/levels/first_level.dart';
import 'package:bace_breaker/src/white/comp/levels/second_level.dart';
import 'package:bace_breaker/src/white/comp/levels/third_level.dart';
import 'package:bace_breaker/src/white/comp/my_ball.dart';
import 'package:bace_breaker/src/white/comp/my_brick.dart';
import 'package:bace_breaker/src/white/comp/player.dart';
import 'package:bace_breaker/src/white/gameoverscreen.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class GamePage extends StatefulWidget {
  


  @override
  State<GamePage> createState() => _GamePageState();
}

enum direction { UP, DOWN, LEFT, RIGHT }

class _GamePageState extends State<GamePage> {

  final myNewFontwhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));

  var ballXDirection = direction.LEFT;
  var ballYDirection = direction.DOWN;
  double ballX = 0;
  double ballY = 0;
  double ballXIncrements = 0.02;
  double ballYIncrements = 0.01;

  double playerX = 0;
  double playerWidth = 0.4;


  static double brickWidth = 0.4;
  static double brickHeight = 0.03;
  bool brickBroken = false;


  bool hasGameStarted = false;
  bool isGameOver = false;
  bool isWon = false;

  bool isFirstActive=false;
  bool isSecondActive=true;
  bool isThirdActive=false;


  List myBricks = [];
  @override
  void initState() {
    if (isFirstActive){
      myBricks = FirstLevel.myBricks;
    } else if (isSecondActive) {
      myBricks = SecondLevel.myBricks;
    } else if (isThirdActive){
      myBricks=ThirdLevel.myBricks;
    }
    super.initState();
  }



  void startGame() {
    hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        updateDirection();
        moveBall();
        if (isPlayerDead()) {
          timer.cancel();
          isGameOver = true;
        }
        if (areBroken()){
          timer.cancel();
          isGameOver = true;
          hasGameStarted = false;
          isWon=true;
          nextLevel();
        }
        checkForBrokenBricks();
      });
    });
  }
  void nextLevel() {
  setState(() {
    if (isFirstActive) {
      isFirstActive = false;
      isSecondActive = true;
      myBricks = SecondLevel.myBricks;
    } else if (isSecondActive) {
      isSecondActive = false;
      isThirdActive = true;
      myBricks = ThirdLevel.myBricks;
    } else if (isThirdActive) {
      isThirdActive = false;
      isFirstActive = true;
      myBricks = FirstLevel.myBricks;
    }
  });
}
  void resetGame() {
    setState(() {
      playerX = 0;
      ballX = 0;
      ballY = 0;
      isGameOver = false;
      hasGameStarted = false;
      isWon = false;
      if (isFirstActive){
      myBricks = FirstLevel.myBricks;
    } else if (isSecondActive) {
      myBricks = SecondLevel.myBricks;
    } else if (isThirdActive){
      myBricks=ThirdLevel.myBricks;
    }
    });
  }

  bool areBroken() {
    return myBricks.every((brick) => brick[2]);
  }

  void checkForBrokenBricks() {
    for (int i = 0; i < myBricks.length; i++) {
      if (ballX >= myBricks[i][0] &&
          ballX <= myBricks[i][0] + brickWidth &&
          ballY <= myBricks[i][1] + brickHeight &&
          myBricks[i][2] == false) {
        setState(() {
          myBricks[i][2] = true;

          double leftSideDist = (myBricks[i][0] - ballX.abs());
          double rightSideDist = (myBricks[i][0] + brickWidth - ballX.abs());
          double topSideDist = (myBricks[i][1] + brickWidth - ballY.abs());
          double bottomSideDist = (myBricks[i][1] + brickHeight - ballY.abs());

          String min =
              findMin(leftSideDist, rightSideDist, topSideDist, bottomSideDist);
          switch (min) {
            case 'left':
              ballXDirection = direction.LEFT;
              break;
            case 'right':
              ballXDirection = direction.RIGHT;
              break;
            case 'top':
              ballYDirection = direction.UP;
              break;
            case 'bottom':
              ballYDirection = direction.DOWN;
              break;
          }
        });
      }
    }
  }

  String findMin(double left, double right, double top, double bottom) {
    List<double> myList = [left, right, top, bottom];
    double currentMin = left;

    for (int i = 0; i < myList.length; i++) {
      if (myList[i] < currentMin) currentMin = myList[i];
    }

    if ((currentMin - left).abs() < 0.01) {
      return 'left';
    } else if ((currentMin - right).abs() < 0.01) {
      return 'right';
    } else if ((currentMin - top).abs() < 0.01) {
      return 'top';
    } else if ((currentMin - bottom).abs() < 0.01) {
      return 'bottom';
    }
    return '';
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      return true;
    }
    return false;
  }

  void updateDirection() {
    if (ballY > 0.9 && ballX >= playerX && ballX <= playerWidth + playerX) {
      ballYDirection = direction.UP;
    } else if (ballY <= -1) {
      ballYDirection = direction.DOWN;
    }

    if (ballX >= 1) {
      ballXDirection = direction.LEFT;
    } else if (ballX <= -1) {
      ballXDirection = direction.RIGHT;
    }
  }

  void moveBall() {
    setState(() {
      if (ballXDirection == direction.LEFT) {
        ballX -= ballXIncrements;
      } else if (ballXDirection == direction.RIGHT) {
        ballX += ballXIncrements;
      }

      if (ballYDirection == direction.DOWN) {
        ballY += ballYIncrements;
      } else if (ballYDirection == direction.UP) {
        ballY -= ballYIncrements;
      }
    });
  }

  void handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      playerX += details.delta.dx / MediaQuery.of(context).size.width;
      if (playerX < -1) {
        playerX = -1;
      } else if (playerX + playerWidth > 1) {
        playerX = 1 - playerWidth;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: handleDragUpdate,
      onTap: startGame,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
              child: Stack(
            children: [
              CoverScreen(
                hasGameStarted: hasGameStarted,
                isGameOver: isGameOver,
                isWon: isWon,
              ),
              GameOverScreen(
                isGameOver: isGameOver,
                isWon: isWon,
                onTap: resetGame,
              ),
              MyBall(
                ballX: ballX,
                ballY: ballY,
                hasGameStarted: hasGameStarted,
                isGameOver: isGameOver,
                isWon: isWon,
              ),
              MyPlayer(
                playerX: playerX,
                playerWidth: playerWidth,
              ),
              !isWon
              ?Stack(
                children: [
                  for (int i = 0; i < myBricks.length; i++)
                    MyBrick(
                      brickHeight: brickHeight,
                      brickWidth: brickWidth,
                      brickX: myBricks[i][0],
                      brickY: myBricks[i][1],
                      brickBroken: myBricks[i][2],
                      color: myBricks[i][3]
                    ),
                ],
              )
              :const Stack(),
            ],
          )),
        ),
      ),
    );
  }
}
