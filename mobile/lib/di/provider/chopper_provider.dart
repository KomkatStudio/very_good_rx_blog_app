import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_rx_blog_app/app/app.dart';
import 'package:very_good_rx_blog_app/data/datasources/storage/storage_datasource.dart';
import 'package:very_good_rx_blog_app/di/interceptor/auth_interceptor.dart';

@singleton
class ChopperProvider {
  ChopperProvider({required StorageDatasource storageDatasource})
      : _storageDatasource = storageDatasource;

  ChopperClient? _chopper;

  final StorageDatasource _storageDatasource;

  ChopperClient getChopperClient() {
    _chopper ??= _createChopper();
    return _chopper!;
  }

  ChopperClient _createChopper() {
    final chopper = ChopperClient(
      baseUrl: Uri.parse(FlavorConfig.instance.values.baseUrl),
      interceptors: [
        HttpLoggingInterceptor(),
        CurlInterceptor(),
      ],
      authenticator: AppAuthenticator(storageDatasource: _storageDatasource),
    );
    return chopper;
  }
}
