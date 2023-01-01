import 'package:injectable/injectable.dart';
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/auth_service.dart';
import 'package:very_good_rx_blog_app/data/datasources/bookmark/remote/bookmark_service.dart';
import 'package:very_good_rx_blog_app/di/provider/chopper_provider.dart';

@module
abstract class ApiServiceProvider {
  @singleton
  AuthService provideAuthService(ChopperProvider chopperProvider) {
    return AuthService.create(
      chopperProvider.getChopperClient(),
    );
  }

  @singleton
  BookmarkService provideBookmarkService(ChopperProvider chopperProvider) {
    return BookmarkService.create(chopperProvider.getChopperClient());
  }
}
