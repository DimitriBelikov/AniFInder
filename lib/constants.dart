import 'package:flutter/material.dart';

const double borderradius = 12.0;
const Color kackgroundcolor = Color(0xE61D1D1D);

const headerStyle = TextStyle(
  fontFamily: 'AkayaKanadaka',
  fontSize: 31,
  color: Colors.white,
);

final ButtonStyle kuttonStyle = ElevatedButton.styleFrom(
  primary: Colors.tealAccent.shade700,
  onPrimary: Colors.black,
  textStyle: TextStyle(
    fontSize: 18.0,
    fontFamily: 'RobotoSlab',
  ),
  padding: EdgeInsets.all(12.0),
  shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderradius)),
);

const TextStyle kextStyleheader = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
  fontFamily: 'TimesNewRoman',
);

const TextStyle kextStyledata = TextStyle(
  fontSize: 24,
  color: Colors.yellow,
  fontFamily: 'TimesNewRoman',
);

const TextStyle kextStyleInfo = TextStyle(
  fontSize: 19,
  color: Colors.yellow,
  fontFamily: 'TimesNewRoman',
);
