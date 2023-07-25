import 'package:expense_tracker/presentaion/extensions/theme_extensions.dart';
import 'package:expense_tracker/presentaion/theme/color_palette.dart';
import 'package:expense_tracker/presentaion/theme/material_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ColorPalette paletteOf(BuildContext context) {
    if (context.theme.brightness == Brightness.light) {
      return LightPalette();
    } else if (context.theme.brightness == Brightness.dark) {
      return DarkPalette();
    } else {
      return LightPalette();
    }
  }

  ThemeData theme(ColorPalette palette) {
    final theme = ThemeData().copyWith(
        buttonTheme: ThemeData().buttonTheme.copyWith(
              buttonColor: palette.accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          actionTextColor: palette.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        scaffoldBackgroundColor: palette.backgroundColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: CustomMaterialColor.generateMaterialColor(
            palette.primaryColorDark,
          ),
          primaryColorDark: palette.primaryColorDark,
          accentColor: palette.accentColor,
          cardColor: palette.cardColor,
          backgroundColor: palette.backgroundColor,
          brightness: palette.brightness,
          errorColor: palette.errorColor,
        ).copyWith(
          secondaryContainer: palette.accentVariantColor,
        ),
        brightness: palette.brightness,
        appBarTheme: const AppBarTheme().copyWith(
          elevation: 0,
          backgroundColor: palette.appBarColor,
          foregroundColor: palette.accentVariantColor,
        ),
        textTheme: ThemeData()
            .textTheme
            .apply(
              bodyColor: palette.accentColor,
              displayColor: palette.backgroundColor,
            )
            .copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: palette.accentColor,
              ),
            ),
        cardTheme: const CardTheme().copyWith(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          color: palette.cardColor,
          elevation: 0,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
        ));

    return theme;
  }
}
