import 'package:dart_either/dart_either.dart';
import 'package:very_good_rx_blog_app/common/errors/app_exception.dart';
import 'package:very_good_rx_blog_app/common/types/nothing.dart';

abstract class AuthRepository {
  Future<Either<AppException, Nothing>> login({
    required String username,
    required String password,
  });

  Future<Either<AppException, Nothing>> register({
    required String lastname,
    required String firstname,
    required String username,
    required String password,
    required String confirmationPassword,
  });

  Future<void> logout();
}
