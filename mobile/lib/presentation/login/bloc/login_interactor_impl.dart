import 'package:authentication_repository/authentication_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:very_good_rx_blog_app/login/bloc/login_contract.dart';

class LoginInteractorImpl implements LoginInteractor {
  LoginInteractorImpl({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<LoginMessage> peformLogin({
    required String username,
    required String password,
  }) {
    Rx.fromCallable(
      () => _authenticationRepository.login(
        username: username,
        password: password,
      ),
    ).onErrorReturn();
  }
}
