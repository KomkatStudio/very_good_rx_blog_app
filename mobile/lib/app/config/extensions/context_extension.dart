import 'package:flutter/widgets.dart';

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
}
