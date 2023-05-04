import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get primaryTextTheme => theme.primaryTextTheme;
  TextTheme get secondaryTextTheme => theme.textTheme;
  ThemeData get theme => Theme.of(this);
}
