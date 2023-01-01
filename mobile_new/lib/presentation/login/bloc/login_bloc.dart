import 'dart:developer';

import 'package:disposebag/disposebag.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:very_good_rx_blog_app/common/extensions/stream_extension.dart';
import 'package:very_good_rx_blog_app/common/utils/validator_utils.dart';
import 'package:very_good_rx_blog_app/domain/repositories/auth_repository.dart';
import 'package:very_good_rx_blog_app/presentation/login/bloc/login_state.dart';

class LoginBloc {
  factory LoginBloc({required AuthRepository authRepository}) {
    final usernameController = PublishSubject<String>();
    final passwordController = PublishSubject<String>();
    final submitLoginController = PublishSubject<void>();
    final isLoadingController = BehaviorSubject<bool>.seeded(false);
    final controller = [
      usernameController,
      passwordController,
      submitLoginController,
      isLoadingController,
    ];

    /// Stream
    ///
    final isValidSubmit$ = Rx.combineLatest3(
      usernameController.stream.map(ValidatorUtils.isValidUserName),
      passwordController.stream.map(ValidatorUtils.isValidPassword),
      isLoadingController.stream,
      (bool isValidUsername, bool isValidPassword, bool isLoading) =>
          isValidUsername && isValidPassword && !isLoading,
    )
        .doOnData(
          (data) => log(data.toString()),
        )
        .shareValueSeeded(false);

    final loginParams$ = Rx.combineLatest2(
      usernameController.stream,
      passwordController.stream,
      (String username, String password) =>
          LoginParams(username: username, password: password),
    )
        .doOnData(
          (data) => log(data.toString()),
        )
        .share();

    final submitLogin$ = submitLoginController.stream
        .withLatestFrom(isValidSubmit$, (_, bool isValid) => isValid)
        .doOnData(
          (data) => log(data.toString()),
        )
        .share();

    final message$ = Rx.merge([
      submitLogin$
          .where((isValid) => isValid)
          .withLatestFrom(loginParams$, (_, LoginParams params) => params)
          .exhaustMap(
            (params) => Rx.defer(() async* {
              await authRepository.login(
                password: params.password,
                username: params.username,
              );
              yield null;
            }),
          )
          .doOnListen(() => isLoadingController.add(true))
          .doOnData((_) => isLoadingController.add(false))
          .doOnError((e, s) => isLoadingController.add(false))
          .map<LoginMessage>((_) => LoginSuccessMessage())
          .onErrorReturnWith(
            (error, stackTrace) => LoginErrorMessage(
              error: error,
            ),
          ),
      isValidSubmit$
          .where((isValid) => !isValid)
          .map((_) => const InvalidInformationMessage())
    ]).share();

    final usernameError$ = usernameController.stream
        .map((username) {
          if (ValidatorUtils.isValidUserName(username)) return null;
          return 'Invalid Username';
        })
        .distinct()
        .share();

    final passwordError$ = passwordController.stream
        .map((password) {
          if (ValidatorUtils.isValidPassword(password)) return null;
          return 'Invalid Password';
        })
        .distinct()
        .share();

    final subs = <String, Stream>{
      'usernameError': usernameError$,
      'passwordError': passwordError$,
      'isLoading': isLoadingController,
      'message': message$,
      'isValidForm': isValidSubmit$
    }.debug();

    return LoginBloc._(
      dispose: DisposeBag([...controller, ...subs]).dispose,
      usernameError$: usernameError$,
      passwordError$: passwordError$,
      isLoading$: isLoadingController,
      loginMessage$: message$,
      onPasswordChanged: passwordController.add,
      onUsernameChanged: usernameController.add,
      loginSubmit: () => submitLoginController.add(null),
    );
  }

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

  final ValueChanged<String> onUsernameChanged;
  final ValueChanged<String> onPasswordChanged;
  final void Function() loginSubmit;

  final Stream<String?> usernameError$;
  final Stream<String?> passwordError$;
  final Stream<bool> isLoading$;
  final Stream<LoginMessage> loginMessage$;

  final void Function() dispose;
}
