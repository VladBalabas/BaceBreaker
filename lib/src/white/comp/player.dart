import 'package:flutter/material.dart';

// class MyPlayer extends StatelessWidget {
//   final playerX;
//   final playerWidth;
//   MyPlayer({this.playerX, this.playerWidth});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment(playerX+playerWidth/2, 0.9),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           height: 15,
//           width: MediaQuery.of(context).size.width*playerWidth/2,
//           // decoration:BoxDecoration(
//           //   color: Colors.grey,
//           // ),
//           child: Image.asset('assets/beat.png', fit: BoxFit.cover,),
//         ),
//       )
//     );
//   }
// }
class MyPlayer extends StatelessWidget {
  final playerX;
  final playerWidth;
  MyPlayer({this.playerX, this.playerWidth});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment((2*playerX+playerWidth)/(2-playerWidth), 0.9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 15,
          width: MediaQuery.of(context).size.width * playerWidth / 2,
          //color: Colors.grey,
          child: Image.asset('assets/beat.png', fit: BoxFit.cover),
        ),
      ),
    );
  }

  void handleDragUpdate(DragUpdateDetails details, BuildContext context) {
  double newPlayerX = playerX + details.delta.dx / (MediaQuery.of(context).size.width * 2);
  if (newPlayerX - playerWidth / 2 < -1) {
    newPlayerX = (-1 + playerWidth / 2).toDouble();
  } else if (newPlayerX + playerWidth / 2 > 1) {
    newPlayerX = (-1 - playerWidth / 2).toDouble();
  }
  //playerX = newPlayerX;
}
}