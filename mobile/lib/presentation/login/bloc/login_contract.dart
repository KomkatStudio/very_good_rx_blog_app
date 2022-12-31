abstract class LoginInteractor {
  Stream<LoginMessage> peformLogin({
    required String username,
    required String password,
  });
}

abstract class LoginMessage {}

class LoginSuccessMessage extends LoginMessage {}

class LoginErrorMessage extends LoginMessage {
  LoginErrorMessage({required this.error});
  final Object error;
}
