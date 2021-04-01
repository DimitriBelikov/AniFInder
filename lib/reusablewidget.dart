import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  String displayText;
  TextStyle textStyle;
  TextAlign alignment;

  ReusableText(
      {required this.displayText,
      required this.textStyle,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$displayText',
      style: textStyle,
      textAlign: alignment,
    );
  }
}
