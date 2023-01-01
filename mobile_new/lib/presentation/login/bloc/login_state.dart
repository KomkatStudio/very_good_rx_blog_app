class LoginParams {
  const LoginParams({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;
}

abstract class LoginMessage {}

class LoginSuccessMessage extends LoginMessage {}

class LoginErrorMessage extends LoginMessage {
  LoginErrorMessage({required this.error});
  final Object error;
}

class InvalidInformationMessage implements LoginMessage {
  const InvalidInformationMessage();
}
