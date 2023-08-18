import 'package:bace_breaker/src/checker.dart';
import 'package:bace_breaker/src/white/initial_page.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'src/black/black.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String state = prefs.getString("state") ?? "";

  Widget initialWidget;

  if (state == "black") {
    initialWidget = WebViewApp();
  } else if (state == "white") {
    initialWidget = InitialPage();
  } else {
    initialWidget = Checker();
  }

  runApp(MaterialApp(
    home: initialWidget,
    debugShowCheckedModeBanner: false,
  ));
}

