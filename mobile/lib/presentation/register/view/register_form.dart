import 'package:flutter/material.dart';
import 'package:very_good_rx_blog_app/app/app.dart';
import 'package:very_good_rx_blog_app/l10n/l10n.dart';
import 'package:very_good_rx_blog_app/presentation/widgets/widgets.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleOfTextField(l10n.firstName),
            _FirstnameInput(),
            const SizedBox(
              height: 16,
            ),
            TitleOfTextField(l10n.lastName),
            _LastnameInput(),
            const SizedBox(
              height: 16,
            ),
            TitleOfTextField(l10n.username),
            _UsernameInput(),
            const SizedBox(
              height: 16,
            ),
            TitleOfTextField(l10n.password),
            _PasswordInput(),
            const SizedBox(
              height: 16,
            ),
            TitleOfTextField(l10n.confirmationPassword),
            _ConfirmedPasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            Center(
              child: _RegisterButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFieldDecoration(
      child: TextField(
        key: const Key('registerForm_usernameInput_textField'),
        onChanged: (username) {},
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          border: InputBorder.none,
          hintText: l10n.usernameHint,
        ),
      ),
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
    super.initState();
    _isHidePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFieldDecoration(
      child: TextField(
        key: const Key('registerForm_passwordInput_textField'),
        onChanged: (password) {},
        textInputAction: TextInputAction.next,
        obscureText: _isHidePassword,
        decoration: InputDecoration(
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
  }
}

class _ConfirmedPasswordInput extends StatefulWidget {
  @override
  State<_ConfirmedPasswordInput> createState() =>
      _ConfirmedPasswordInputState();
}

class _ConfirmedPasswordInputState extends State<_ConfirmedPasswordInput> {
  late bool _isHideConfirmationPassword;

  @override
  void initState() {
    super.initState();
    _isHideConfirmationPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFieldDecoration(
      child: TextField(
        key: const Key('registerForm_confirmedPass_textField'),
        onChanged: (confirmedPassword) {},
        obscureText: _isHideConfirmationPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          border: InputBorder.none,
          hintText: l10n.confirmationPasswordHint,
          suffixIcon: IconButton(
            icon: _isHideConfirmationPassword
                ? Assets.icons.show.svg(color: AppPalette.primaryColor)
                : Assets.icons.hide.svg(color: AppPalette.primaryColor),
            onPressed: () {
              setState(() {
                _isHideConfirmationPassword = !_isHideConfirmationPassword;
              });
            },
            splashRadius: 24,
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}

class _FirstnameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFieldDecoration(
      child: TextField(
        key: const Key('registerForm_firstnameInput_textField'),
        onChanged: (firstName) {},
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          border: InputBorder.none,
          hintText: l10n.firstNameHint,
        ),
      ),
    );
  }
}

class _LastnameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return TextFieldDecoration(
      child: TextField(
        key: const Key('registerForm_passwordInput_textField'),
        onChanged: (lastName) {},
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          border: InputBorder.none,
          hintText: l10n.lastNameHint,
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      key: const Key('registerForm_continue_raisedButton'),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(130, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        l10n.register,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppPalette.whiteBackgroundColor,
        ),
      ),
    );
  }
}
