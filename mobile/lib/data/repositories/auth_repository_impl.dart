import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_rx_blog_app/app/app.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/auth_exception.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/auth_service.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/body/login_body.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/body/register_body.dart';
import 'package:very_good_rx_blog_app/data/datasources/storage/storage_datasource.dart';
import 'package:very_good_rx_blog_app/domain/repositories/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required StorageDatasource storageDatasource,
    required AuthService authService,
  })  : _storageDatasource = storageDatasource,
        _authService = authService;

  final StorageDatasource _storageDatasource;
  final AuthService _authService;

  @override
  Future<Either<AppException, Nothing>> login({
    required String username,
    required String password,
  }) =>
      _authService
          .login(
        body: LoginBody(username: username, password: password),
      )
          .then(
        (response) async {
          if (!response.isSuccessful) {
            throw LoginException(error: response.error);
          }
          final loginResponse = response.body!;
          await Future.wait([
            _storageDatasource.storeJwt(loginResponse.jwt ?? ''),
            _storageDatasource.storeUserId(loginResponse.id ?? '')
          ]);
          return Nothing();
        },
      ).toEitherFuture<AppException>(
        (e, s) => LoginException(error: e, stackTrace: s),
      );

  @override
  Future<Either<AppException, Nothing>> register({
    required String lastname,
    required String firstname,
    required String username,
    required String password,
    required String confirmationPassword,
  }) =>
      _authService
          .register(
        body: RegisterBody(
          username: username,
          password: password,
          confirmationPassword: confirmationPassword,
          firstName: firstname,
          lastName: lastname,
        ),
      )
          .then(
        (response) async {
          if (!response.isSuccessful) {
            throw RegisterException(error: response.error);
          }
          return Nothing();
        },
      ).toEitherFuture<AppException>(
        (e, s) => LoginException(error: e, stackTrace: s),
      );

  @override
  Future<void> logout() => _storageDatasource.clearAllStorage();
}
