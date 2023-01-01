import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:very_good_rx_blog_app/common/gen/fonts.gen.dart';
import 'package:very_good_rx_blog_app/common/routers/app_router.gr.dart';
import 'package:very_good_rx_blog_app/common/themes/app_text_theme.dart';
import 'package:very_good_rx_blog_app/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.materialBaseline,
        textTheme: AppTextTheme().textTheme,
        useMaterial3: true,
        fontFamily: FontFamily.nunito,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.materialBaseline,
        textTheme: AppTextTheme().textTheme,
        fontFamily: FontFamily.nunito,
        useMaterial3: true,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
