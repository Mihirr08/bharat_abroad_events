import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ThemeConstants {
  // static const royalBlueColor = Color(0xff4169E1);
  // static const goldColor = Color(0xffFFD700);
  // static const deepRed = Color(0xff850101);
  // static const creamColor = goldColor; //(0xffFBC678);

  static final ThemeData royalBlueTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xffE52956),
      secondary: Color(0xffF59E2B),
      tertiary: Color(0xff1A9996),
      background: Colors.white,
      brightness: Brightness.light,
      onBackground: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      onSurface: Colors.white,
      surface: Colors.white,
    ),
    primaryColor: const Color(0xffE52956),
    fontFamily: "Roboto",
    primarySwatch: getMaterialColor(const Color(0xffE52956)),
  );
}

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;
  final int alpha = color.alpha;

  final Map<int, Color> shades = {
    50: Color.fromARGB(alpha, red, green, blue),
    100: Color.fromARGB(alpha, red, green, blue),
    200: Color.fromARGB(alpha, red, green, blue),
    300: Color.fromARGB(alpha, red, green, blue),
    400: Color.fromARGB(alpha, red, green, blue),
    500: Color.fromARGB(alpha, red, green, blue),
    600: Color.fromARGB(alpha, red, green, blue),
    700: Color.fromARGB(alpha, red, green, blue),
    800: Color.fromARGB(alpha, red, green, blue),
    900: Color.fromARGB(alpha, red, green, blue),
  };

  return MaterialColor(color.value, shades);
}
