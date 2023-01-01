import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  EdgeInsets get padding {
    return MediaQuery.of(this).padding;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;
}
