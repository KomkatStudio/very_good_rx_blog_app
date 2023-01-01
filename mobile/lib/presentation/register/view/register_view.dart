import 'package:flutter/material.dart';
import 'package:very_good_rx_blog_app/app/app.dart';
import 'package:very_good_rx_blog_app/l10n/l10n.dart';
import 'package:very_good_rx_blog_app/presentation/register/view/register_form.dart';
import 'package:very_good_rx_blog_app/presentation/widgets/dismiss_focus_keyboard.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DismissFocusKeyboard(
      child: Scaffold(
        backgroundColor: AppPalette.whiteBackgroundColor,
        body: Padding(
          padding: EdgeInsets.only(top: context.padding.top + 16),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Center(
                  child: SizedBox(
                    height: 120,
                    child: FittedBox(
                      child: Assets.images.logo.image(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Expanded(
                flex: 10,
                child: RegisterForm(),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
