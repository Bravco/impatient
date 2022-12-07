import 'package:flutter/material.dart';

Color colorText = Colors.white;
Color colorTextAlt = const Color(0xFF929395);

Color color10 = const Color(0xFF7572FF);

Color color30 = const Color(0xFF26272C);

LinearGradient bgGradient = const LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF556A9E),
    Color(0xFF212121),
  ],
);

TextStyle h1TextStyle = TextStyle(
  color: colorText,
  fontSize: 32,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.5,
);

TextStyle h2TextStyle = TextStyle(
  color: colorText,
  fontSize: 24,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.5,
);

TextStyle h3TextStyle = TextStyle(
  color: colorTextAlt,
  fontSize: 16,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.5,
);