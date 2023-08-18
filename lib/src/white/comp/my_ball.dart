import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  
  final ballX;
  final ballY;
  final hasGameStarted;
  final isGameOver;
  final isWon;
  MyBall({this.ballX, this.ballY, this.hasGameStarted,this.isGameOver, this.isWon});
  @override
  Widget build(BuildContext context) {
    return hasGameStarted
    ?Container(
      alignment: Alignment(ballX, ballY),
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: isGameOver? Colors.grey[200]:Colors.grey[400],
          shape: BoxShape.circle,
        ),
        child: Image.asset('assets/ball.png'),
      ),
    )
    :!isWon
    ?Container(
      alignment: Alignment(ballX,ballY),
      child: AvatarGlow(
        endRadius: 60,
        child: Material(
          elevation: 8,
          shape: const CircleBorder(),
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            radius: 12,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              width: 25,
              height: 25,
              child: Image.asset('assets/ball.png'),
            ),
          ),
        ) 
      ),
    )
    :Container();
  }
}
