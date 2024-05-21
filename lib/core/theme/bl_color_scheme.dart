import 'package:bucket_list/core/theme/bl_colors.dart';
import 'package:flutter/material.dart';

abstract class BlColorScheme {
  static const scheme = ColorScheme(
    brightness: Brightness.dark,
    primary: BLColors.primary100,
    onPrimary: BLColors.grayscaleWhite,
    primaryContainer: BLColors.accentP100,
    secondary: BLColors.accentP100,
    onSecondary: BLColors.grayscaleWhite,
    secondaryContainer: BLColors.grayscalegray30,
    tertiary: BLColors.accentS100,
    error: Colors.red,
    onError: BLColors.grayscaleWhite,
    surface: BLColors.grayscalegray70,
    onSurface: BLColors.grayscaleWhite,
    surfaceDim: BLColors.grayscalegray80,
    surfaceBright: BLColors.grayscalegray60,
  );
}
