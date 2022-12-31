import 'package:chopper/chopper.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/body/login_body.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/body/register_body.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/response/login_response.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/response/register_response.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: '/api/v1/auth')
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client);

  @Post(path: '/login')
  Future<Response<LoginResponse>> login({
    @Body() required LoginBody body,
  });

  @Post(path: '/register')
  Future<Response<RegisterResponse>> register({
    @Body() required RegisterBody body,
  });
}
