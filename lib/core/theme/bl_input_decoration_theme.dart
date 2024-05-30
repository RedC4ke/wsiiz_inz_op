import 'package:bucket_list/core/theme/bl_color_scheme.dart';
import 'package:bucket_list/core/theme/bl_colors.dart';
import 'package:bucket_list/core/theme/bl_text_theme.dart';
import 'package:flutter/material.dart';

enum BorderType { disabled, enabled, focused, error, focusedError }

abstract class BlInputDecorationTheme {
  static const _padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 13,
  );

  static final InputDecorationTheme themeLight = InputDecorationTheme(
    alignLabelWithHint: true,
    errorBorder: borderLight(BorderType.error),
    focusedBorder: borderLight(BorderType.focused),
    focusedErrorBorder: borderLight(BorderType.focusedError),
    enabledBorder: borderLight(BorderType.enabled),
    disabledBorder: borderLight(BorderType.disabled),
    fillColor: BlColors.skyWhite,
    filled: true,
    contentPadding: _padding,
    hintStyle: BlTextTheme.theme.bodyMedium?.copyWith(
      color: BlColors.inkDark,
      height: 1,
    ),
  );

  static InputBorder borderLight(BorderType type) {
    final radius = BorderRadius.circular(16);

    final borderColor = switch (type) {
      BorderType.enabled => BlColorScheme.light.outline,
      BorderType.disabled => BlColorScheme.light.outlineVariant,
      BorderType.focused => BlColorScheme.light.primary,
      BorderType.error => BlColorScheme.light.error,
      BorderType.focusedError => BlColorScheme.light.error,
    };
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
      borderRadius: radius,
    );
  }
}
