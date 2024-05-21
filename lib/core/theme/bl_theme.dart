import 'package:bucket_list/core/theme/bl_color_scheme.dart';
import 'package:bucket_list/core/theme/bl_colors.dart';
import 'package:bucket_list/core/theme/bl_input_decoration_theme.dart';
import 'package:bucket_list/core/theme/bl_text_theme.dart';
import 'package:flutter/material.dart';

abstract class BLTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: BlTextTheme.theme.apply(
      displayColor: BLColors.grayscaleWhite,
      bodyColor: BLColors.grayscaleWhite,
    ),
    colorScheme: BlColorScheme.scheme,
    inputDecorationTheme: BlInputDecorationTheme.theme,
  );
}
