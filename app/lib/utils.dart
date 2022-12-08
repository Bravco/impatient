import 'package:flutter/material.dart';

Color colorText = Colors.white;
Color colorTextAlt = const Color(0xFF929395);

Color overlayGrey = const Color(0xFF929395);

Color color10 = const Color(0xFF7572FF);
Color color10Alt = color10.withOpacity(.3);

Color color30 = const Color(0xFF26272C);

BoxShadow boxShadow = BoxShadow(
  color: Colors.black.withOpacity(.1),
  blurRadius: 20,
  spreadRadius: 4,
);

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
  letterSpacing: 1.4,
);

TextStyle h1TextStyleAlt = TextStyle(
  color: colorTextAlt,
  fontSize: 32,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.4,
);

TextStyle h2TextStyle = TextStyle(
  color: colorText,
  fontSize: 24,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.4,
);

TextStyle h2TextStyleAlt = TextStyle(
  color: colorTextAlt,
  fontSize: 24,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.4,
);

TextStyle h3TextStyle = TextStyle(
  color: colorText,
  fontSize: 20,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.4,
);

TextStyle h3TextStyleAlt = TextStyle(
  color: colorTextAlt,
  fontSize: 20,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.4,
);

TextStyle h4TextStyle = TextStyle(
  color: colorText,
  fontSize: 16,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.2,
);

TextStyle h4TextStyleAlt = TextStyle(
  color: colorTextAlt,
  fontSize: 16,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.2,
);

TextStyle h5TextStyle = TextStyle(
  color: colorText,
  fontSize: 12,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.2,
);

TextStyle h5TextStyleAlt = TextStyle(
  color: colorTextAlt,
  fontSize: 12,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.2,
);