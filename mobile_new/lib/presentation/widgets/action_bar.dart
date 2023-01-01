import 'package:flutter/material.dart';
import 'package:very_good_rx_blog_app/common/extensions/context_extension.dart';
import 'package:very_good_rx_blog_app/common/gen/assets.gen.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    super.key,
    this.title,
    this.actions,
    this.titleFontSize = 18,
  });

  final String? title;
  final List<Widget>? actions;
  final double titleFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          // alignment: Alignment.centerLeft,
          padding: EdgeInsets.zero,
          icon: Assets.icons.circleArrowLeft.svg(
            color: context.colorScheme.primary,
            height: 36,
          ),
          splashRadius: 24,
          onPressed: () {},
        ),
        const SizedBox(
          width: 16,
        ),
        if (title != null)
          Expanded(
            child: Align(
              child: Text(
                title!,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: titleFontSize,
                  color: context.colorScheme.onPrimary,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        const SizedBox(
          width: 16,
        ),
        if (actions != null)
          Row(
            children: actions!,
          )
        else
          const Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox.square(
              dimension: 30,
            ),
          ),
      ],
    );
  }
}
