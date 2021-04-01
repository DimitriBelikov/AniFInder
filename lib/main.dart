import 'package:anifinder/screens/homepage.dart';
import 'package:anifinder/screens/resultscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AniFinder());
}

class AniFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/results': (context) => ResultScreen(),
      },
    );
  }
}
