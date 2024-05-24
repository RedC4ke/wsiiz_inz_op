import 'package:bucket_list/core/theme/bl_colors.dart';
import 'package:flutter/material.dart';

abstract class BlColorScheme {
  static const scheme = ColorScheme(
    brightness: Brightness.dark,
    primary: BLColors.primaryBase,
    onPrimary: BLColors.skyWhite,
    primaryContainer: BLColors.primaryLight,
    secondary: BLColors.greenBase,
    onSecondary: BLColors.skyWhite,
    secondaryContainer: BLColors.greenLight,
    error: BLColors.redBase,
    onError: BLColors.skyWhite,
    errorContainer: BLColors.redLight,
    onErrorContainer: BLColors.redDarkest,
    surface: BLColors.skyLightest,
    onSurface: BLColors.inkDark,
    surfaceDim: BLColors.skyLighter,
    surfaceBright: BLColors.skyWhite,
  );
}
