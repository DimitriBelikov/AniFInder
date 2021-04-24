import 'package:anifinder/screens/homepage.dart';
import 'package:flutter/material.dart';

import 'screens/homepage.dart';
import 'screens/resultscreen.dart';

void main() {
  runApp(AniFinder());
}

class AniFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        HomePage.homePageRoute: (context) => HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ResultScreen.resultScreenRoute) {
          final ResultArguments args = settings.arguments as ResultArguments;
          return MaterialPageRoute(
            builder: (context) {
              return ResultScreen(args.result, args.image);
            },
          );
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
