import 'package:flutter/material.dart';
import 'package:very_good_rx_blog_app/common/extensions/context_extension.dart';

class TextFieldDecoration extends StatelessWidget {
  const TextFieldDecoration({
    super.key,
    required this.child,
    this.margin = const EdgeInsets.only(top: 10),
    this.padding,
    this.fieldColor,
  });

  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final Color? fieldColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: fieldColor ?? context.colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
