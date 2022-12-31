import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:very_good_rx_blog_app/app/app.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/auth_service.dart';
import 'package:very_good_rx_blog_app/data/datasources/http_client_handler.dart';
import 'package:very_good_rx_blog_app/di/provider/chopper_provider.dart';



@module
abstract class ApiServiceProvider {

  
  @singleton
  AuthService provideAuthService(ChopperProvider chopperProvider) {
    return AuthService.create(
      chopperProvider.getChopperClient(),
    );
  }
}
