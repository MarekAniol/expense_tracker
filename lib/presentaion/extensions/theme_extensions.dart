import 'package:expense_tracker/presentaion/theme/app_theme.dart';
import 'package:expense_tracker/presentaion/theme/color_palette.dart';
import 'package:flutter/material.dart';

extension AppThemes on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppBarTheme get appBarThemes => theme.appBarTheme;

  ColorPalette get palette => AppTheme.paletteOf(this);

  ColorScheme get colors => theme.colorScheme;
}
