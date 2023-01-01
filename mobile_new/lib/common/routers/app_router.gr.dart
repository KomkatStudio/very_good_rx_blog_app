// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:very_good_rx_blog_app/presentation/login/view/login_page.dart'
    as _i2;
import 'package:very_good_rx_blog_app/presentation/main/view/main_page.dart'
    as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          MainPageRoute.name,
          path: '/main-page',
        ),
        _i3.RouteConfig(
          LoginPageRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainPageRoute extends _i3.PageRouteInfo<void> {
  const MainPageRoute()
      : super(
          MainPageRoute.name,
          path: '/main-page',
        );

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i3.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: '/',
        );

  static const String name = 'LoginPageRoute';
}
