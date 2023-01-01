
import 'package:very_good_rx_blog_app/common/errors/app_exception.dart';

class AuthException implements AppException {
  AuthException({this.error, this.stackTrace});
  final Object? error;
  final StackTrace? stackTrace;
}

class LoginException extends AuthException {
  LoginException({super.error, super.stackTrace});
}

class RegisterException extends AuthException {
  RegisterException({super.error, super.stackTrace});
}
