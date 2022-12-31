import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_rx_blog_app/di/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async => getIt.init();
