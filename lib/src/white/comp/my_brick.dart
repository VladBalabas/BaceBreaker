import 'package:flutter/material.dart';

class MyBrick extends StatelessWidget {
  final double brickX;
  final double brickY;
  final double brickHeight;
  final double brickWidth;
  final bool brickBroken;
  final Color color;
  MyBrick(
      {required this.brickHeight,
      required this.brickWidth,
      required this.brickX,
      required this.brickY,
      required this.brickBroken,
      required this.color
      }
    );


  @override
  Widget build(BuildContext context) {
    return brickBroken
    ?Container()
    :Container(
      alignment: Alignment((2*brickX+brickWidth)/(2-brickWidth), brickY),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: MediaQuery.of(context).size.height * brickHeight / 2,
          width: MediaQuery.of(context).size.width * brickWidth / 2,
          color: color,
        ),
      ),
    );
    
  }
}