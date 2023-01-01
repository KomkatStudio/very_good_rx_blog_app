import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:very_good_rx_blog_app/common/extensions/context_extension.dart';
import 'package:very_good_rx_blog_app/common/gen/assets.gen.dart';
import 'package:very_good_rx_blog_app/di/di.dart';
import 'package:very_good_rx_blog_app/domain/repositories/auth_repository.dart';
import 'package:very_good_rx_blog_app/l10n/l10n.dart';
import 'package:very_good_rx_blog_app/presentation/login/bloc/login_bloc.dart';
import 'package:very_good_rx_blog_app/presentation/login/view/login_form.dart';
import 'package:very_good_rx_blog_app/presentation/widgets/dismiss_focus_keyboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return DismissFocusKeyboard(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: context.padding.top + 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: FittedBox(
                    child: Assets.images.logo.image(),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: context.screenHeight * 0.65,
                child: Provider<LoginBloc>(
                  create: (context) =>
                      LoginBloc(authRepository: getIt<AuthRepository>()),
                  dispose: (_, bloc) => bloc.dispose(),
                  child: const LoginForm(),
                ),
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: l10n.notHaveAccountYet,
                    children: [
                      TextSpan(
                        text: l10n.register,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      )
                    ],
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.06,
              )
            ],
          ),
        ),
      ),
    );
  }
}
