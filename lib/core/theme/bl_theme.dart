import 'package:bucket_list/core/theme/bl_color_scheme.dart';
import 'package:bucket_list/core/theme/bl_colors.dart';
import 'package:bucket_list/core/theme/bl_input_decoration_theme.dart';
import 'package:bucket_list/core/theme/bl_text_theme.dart';
import 'package:flutter/material.dart';

abstract class BlTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: BlTextTheme.theme.apply(
      displayColor: BlColors.inkDark,
      bodyColor: BlColors.inkDark,
    ),
    colorScheme: BlColorScheme.light,
    inputDecorationTheme: BlInputDecorationTheme.themeLight,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: BlColors.primaryBase,
      shape: CircleBorder(),
      sizeConstraints: BoxConstraints.tightFor(
        height: 52,
        width: 52,
      ),
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      space: 1,
      thickness: 1,
    ),
    iconTheme: const IconThemeData(
      color: BlColors.inkDark,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: BlColors.primaryBase,
      ),
    ),
  );
}
