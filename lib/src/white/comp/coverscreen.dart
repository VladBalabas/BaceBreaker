import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoverScreen extends StatelessWidget {
  
  final bool hasGameStarted;
  final bool isGameOver;
  final bool isWon;
  CoverScreen({super.key, required this.hasGameStarted, required this.isGameOver, required this.isWon});
  final myNewFontwhite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3)
  );
  @override
  Widget build(BuildContext context) {
    return hasGameStarted
    ? Container(
            alignment: Alignment(0, -0.5),
          child: Text(isGameOver? '':'BACE BREAKER', style: myNewFontwhite.copyWith(fontSize: 20, letterSpacing: 10, color: Colors.grey[600] ),),
        )
    : Stack(
      children: [
        Container(
            alignment: Alignment(0, -0.2),
          child: Text(isWon?'':'tap to play', style: myNewFontwhite.copyWith(fontSize: 20),),
        ),
        Container(
            alignment: Alignment(0, -0.5),
          child: Text(isWon?'':'BACE BREAKER', style: myNewFontwhite.copyWith(fontSize: 20, letterSpacing: 10, ),),
        ),
      ],
    );
  }
}