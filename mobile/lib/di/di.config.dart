// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:very_good_rx_blog_app/data/datasources/auth/remote/auth_service.dart'
    as _i6;
import 'package:very_good_rx_blog_app/data/datasources/storage/storage_datasource.dart'
    as _i4;
import 'package:very_good_rx_blog_app/data/repositories/auth_repository_impl.dart'
    as _i8;
import 'package:very_good_rx_blog_app/di/module/network_module.dart' as _i9;
import 'package:very_good_rx_blog_app/di/module/storage_module.dart' as _i10;
import 'package:very_good_rx_blog_app/di/provider/chopper_provider.dart' as _i5;
import 'package:very_good_rx_blog_app/domain/repositories/auth_repository.dart'
    as _i7;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final apiServiceProvider = _$ApiServiceProvider();
    gh.singleton<_i3.FlutterSecureStorage>(storageModule.secureStorage);
    gh.singleton<_i4.StorageDatasource>(_i4.StorageDatasourceImpl(
        secureStorage: gh<_i3.FlutterSecureStorage>()));
    gh.singleton<_i5.ChopperProvider>(
        _i5.ChopperProvider(storageDatasource: gh<_i4.StorageDatasource>()));
    gh.singleton<_i6.AuthService>(
        apiServiceProvider.provideAuthService(gh<_i5.ChopperProvider>()));
    gh.singleton<_i7.AuthRepository>(_i8.AuthRepositoryImpl(
      storageDatasource: gh<_i4.StorageDatasource>(),
      authService: gh<_i6.AuthService>(),
    ));
    return this;
  }
}

class _$ApiServiceProvider extends _i9.ApiServiceProvider {}

class _$StorageModule extends _i10.StorageModule {}
