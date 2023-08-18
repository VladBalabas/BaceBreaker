
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'comp/my_button.dart';
import 'initial_page.dart';

class GameOverScreen extends StatelessWidget {
  
  final bool isGameOver;
  final bool isWon;
 
  final Function()? onTap;
  final myNewFontwhite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3)
  );
  GameOverScreen({required this.onTap,required this.isGameOver, required this.isWon});
  @override
  Widget build(BuildContext context) {
    return isGameOver
    ? Stack(
        children: [
          Container(
          alignment: Alignment(0,-0.3),
          child: Text(isWon? 'Y O U  W I N':'G A M E  O V E R', style: myNewFontwhite.copyWith(fontSize: 20)),
        ),
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          MyButton(
            onTap: onTap, 
            height: 40, 
            width: 140, 
            child: Text(isWon? 'NEXT LEVEL':'PLAY AGAIN', style: myNewFontwhite.copyWith(color: Colors.black, fontSize: 10, letterSpacing: 1),)
          ),
        const SizedBox(height: 10,),
        MyButton(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InitialPage()));
            }, 
            height: 40, 
            width: 140, 
            child: Text('MAIN MENU', style: myNewFontwhite.copyWith(color: Colors.black, fontSize: 10, letterSpacing: 1),)
          )
        
          ],
        )
      ]
    )
    :Container();
  }
}