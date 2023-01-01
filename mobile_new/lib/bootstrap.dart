import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:timeago/timeago.dart';
import 'package:very_good_rx_blog_app/di/di.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printEmojis: false,
    ),
  );
  FlutterError.onError = (details) {
    logger.e('Flutter Error =>>', details.exceptionAsString(), details.stack);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await configureInjection();
  setLocaleMessages('vi', ViMessages());
  setDefaultLocale('vi');
  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) =>
        logger.e('RunGuardError=>>', error.toString(), stackTrace),
  );
}
