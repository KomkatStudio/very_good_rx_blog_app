import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:very_good_rx_blog_app/app/app.dart';
import 'package:very_good_rx_blog_app/l10n/l10n.dart';
import 'package:very_good_rx_blog_app/presentation/login/bloc/login_bloc.dart';
import 'package:very_good_rx_blog_app/presentation/widgets/widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleOfTextField(l10n.username),
          _UsernameInput(),
          const Padding(padding: EdgeInsets.all(12)),
          TitleOfTextField(l10n.password),
          _PasswordInput(),
          const SizedBox(
            height: 24,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              l10n.forgotPassword,
              style: const TextStyle(
                color: AppPalette.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(12)),
          Center(
            child: _LoginButton(),
          ),
        ],
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final loginBloc = context.read<LoginBloc>();
    return StreamBuilder<String?>(
      stream: loginBloc.usernameError$,
      builder: (context, snapshot) {
        return TextFieldDecoration(
          child: TextField(
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: loginBloc.onUsernameChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
              border: InputBorder.none,
              hintText: l10n.usernameHint,
              errorText: snapshot.data != null ? l10n.usernameEmpty : null,
            ),
            textInputAction: TextInputAction.next,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  late bool _isHidePassword;

  @override
  void initState() {
    _isHidePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final loginBloc = context.read<LoginBloc>();

    return StreamBuilder<String?>(
      stream: loginBloc.passwordError$,
      builder: (context, snapshot) {
        return TextFieldDecoration(
          child: TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: loginBloc.onPasswordChanged,
            decoration: InputDecoration(
              errorText: snapshot.data != null ? l10n.passwordEmpty : null,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
              border: InputBorder.none,
              hintText: l10n.passwordHint,
              suffixIcon: IconButton(
                icon: _isHidePassword
                    ? Assets.icons.show.svg(color: AppPalette.primaryColor)
                    : Assets.icons.hide.svg(color: AppPalette.primaryColor),
                onPressed: () {
                  setState(() {
                    _isHidePassword = !_isHidePassword;
                  });
                },
                splashRadius: 24,
              ),
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final loginBloc = context.read<LoginBloc>();

    return StreamBuilder<bool>(
      stream: loginBloc.isLoading$,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const CircularProgressIndicator(
            color: AppPalette.primaryColor,
          );
        }
        return ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          onPressed: loginBloc.loginSubmit,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(130, 50),
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            l10n.login,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppPalette.whiteBackgroundColor,
            ),
          ),
        );
      },
    );
  }
}
