import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowDynamicValue => height * 0.01;
  double get normalDynamicValue => height * 0.02;
  double get mediumDynamicValue => height * 0.04;
  double get highDynamicValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get extColor => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowDynamicValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalDynamicValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumDynamicValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highDynamicValue);
}

extension PageColorExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(microseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}
