import 'package:auto_route/auto_route.dart';
import 'package:very_good_rx_blog_app/presentation/login/view/login_page.dart';
import 'package:very_good_rx_blog_app/presentation/main/view/main_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Route',
  routes: [
    AutoRoute(
      page: MainPage,
    ),
    AutoRoute(
      page: LoginPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
