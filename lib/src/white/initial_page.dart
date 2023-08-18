import 'package:avatar_glow/avatar_glow.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'comp/myRow.dart';
import 'comp/sound_manager.dart';
import 'game_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  final myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  final myNewFontwhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));

  SoundManager soundManager = SoundManager();

  @override
  void dispose() {
    soundManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Column(
              //       children: [
              //         SafeArea(
              //           child: GestureDetector(
              //             onTap: () {
              //               setState(() {
              //                 soundManager.toggleSound();
              //               });
              //             },
              //             child: Icon(
              //               soundManager.isSoundOn
              //                   ? Icons.volume_up
              //                   : Icons.volume_off,
              //               size: 40,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                    child: Text(
                  'Bace breaker',
                  style: myNewFontwhite.copyWith(fontSize: 25),
                )),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                      child: AvatarGlow(
                    endRadius: 180,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.none),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        radius: 110,
                        child: Image.asset(
                          'assets/logo.png',
                        ),
                      ),
                    ),
                  ))),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      color: Colors.white,
                      child: Center(
                        child: Text('PLAY GAME', style: myNewFont),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: 300, // Ширина контейнера
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyRow(
                                text: 'Music',
                                icon: Icons.check,
                                soundManager: soundManager,
                              ),
                              SizedBox(height: 16),
                              MyRow1(text: 'SFX'),
                              SizedBox(height: 16),
                              MyRow1(text: 'Vibration'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      color: Colors.white,
                      child: Center(
                        child: Text('SETTINGS', style: myNewFont),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
