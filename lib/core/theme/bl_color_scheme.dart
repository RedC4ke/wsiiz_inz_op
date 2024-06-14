import 'package:bucket_list/core/theme/bl_colors.dart';
import 'package:flutter/material.dart';

abstract class BlColorScheme {
  static const light = ColorScheme(
    brightness: Brightness.dark,
    primary: BlColors.primaryBase,
    onPrimary: BlColors.skyWhite,
    primaryContainer: BlColors.primaryLight,
    secondary: BlColors.greenBase,
    onSecondary: BlColors.skyWhite,
    secondaryContainer: BlColors.greenLight,
    error: BlColors.redBase,
    onError: BlColors.skyWhite,
    errorContainer: BlColors.redLight,
    onErrorContainer: BlColors.redDarkest,
    surface: BlColors.skyLightest,
    onSurface: BlColors.inkDark,
    surfaceDim: BlColors.skyLighter,
    surfaceBright: BlColors.skyWhite,
  );
}
