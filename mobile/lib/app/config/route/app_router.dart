import 'package:auto_route/auto_route.dart';
import 'package:very_good_rx_blog_app/presentation/login/login.dart';
import 'package:very_good_rx_blog_app/presentation/main/view/main_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Route',
  routes: [
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(page: LoginPage),
  ],
)
class $AppRouter {}
