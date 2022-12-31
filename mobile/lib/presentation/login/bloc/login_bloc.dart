import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:very_good_rx_blog_app/login/login.dart';

class LoginBloc {

  LoginBloc._({
    required this.onPasswordChanged,
    required this.loginSubmit,
    required this.usernameError$,
    required this.passwordError$,
    required this.isLoading$,
    required this.loginMessage$,
    required this.dispose,
    required this.onUsernameChanged,
  });


  factory

  final ValueChanged<String> onUsernameChanged;
  final ValueChanged<String> onPasswordChanged;
  final void Function() loginSubmit;

  final Stream<UsernameValidationError> usernameError$;
  final Stream<PasswordValidationError> passwordError$;
  final ValueStream<bool> isLoading$;
  final Stream<String> loginMessage$;

  final void Function() dispose;
}
