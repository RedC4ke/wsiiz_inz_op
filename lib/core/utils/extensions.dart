import 'package:bucket_list/gen/l10n.dart';
import 'package:flutter/material.dart';

extension XBuildContext on BuildContext {
  S get s => S.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;
}
