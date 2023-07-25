import 'package:flutter/material.dart';

abstract class ColorPalette {
  late Brightness brightness;
  late Color primaryColorDark;
  late Color accentColor;
  late Color accentVariantColor;
  late Color cardColor;
  late Color backgroundColor;
  late Color errorColor;
  late Color appBarColor;
}

class LightPalette implements ColorPalette {
  @override
  Brightness brightness = Brightness.light;

  @override
  Color accentColor = const Color.fromARGB(255, 43, 43, 43);

  @override
  Color backgroundColor = Colors.white;

  @override
  Color cardColor = const Color.fromARGB(255, 165, 205, 243);

  @override
  Color errorColor = const Color.fromARGB(255, 212, 49, 47);

  @override
  Color primaryColorDark = const Color.fromARGB(255, 20, 86, 140);

  @override
  Color accentVariantColor = const Color.fromARGB(255, 243, 243, 243);

  @override
  Color appBarColor = const Color.fromARGB(255, 9, 72, 114);
}

class DarkPalette implements ColorPalette {
  @override
  Brightness brightness = Brightness.dark;

  @override
  Color accentColor = const Color.fromARGB(255, 214, 220, 228);

  @override
  Color backgroundColor = const Color.fromARGB(255, 24, 24, 24);

  @override
  Color cardColor = const Color.fromARGB(255, 9, 63, 114);

  @override
  Color errorColor = const Color.fromARGB(255, 235, 119, 119);

  @override
  Color primaryColorDark = const Color.fromARGB(255, 156, 214, 248);

  @override
  Color accentVariantColor = const Color.fromARGB(255, 218, 230, 247);

  @override
  Color appBarColor = const Color.fromARGB(255, 3, 31, 53);
}
