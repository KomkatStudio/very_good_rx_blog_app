import 'package:flutter/material.dart';
import 'package:very_good_rx_blog_app/common/extensions/context_extension.dart';

class BlogCardPlaceholder extends StatelessWidget {
  const BlogCardPlaceholder({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 24),
  });

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 1,
                child: ColoredBox(
                  color: context.colorScheme.background,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    color: context.colorScheme.background,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 12,
                    color: context.colorScheme.background,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 12,
                    color: context.colorScheme.background,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
