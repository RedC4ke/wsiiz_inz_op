import 'package:bucket_list/core/theme/bl_color_scheme.dart';
import 'package:bucket_list/core/theme/bl_colors.dart';
import 'package:bucket_list/core/theme/bl_input_decoration_theme.dart';
import 'package:bucket_list/core/theme/bl_text_theme.dart';
import 'package:flutter/material.dart';

abstract class BLTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: BlTextTheme.theme.apply(
      displayColor: BLColors.inkDark,
      bodyColor: BLColors.inkDark,
    ),
    colorScheme: BlColorScheme.scheme,
    inputDecorationTheme: BlInputDecorationTheme.theme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: BLColors.primaryBase,
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
  );
}
