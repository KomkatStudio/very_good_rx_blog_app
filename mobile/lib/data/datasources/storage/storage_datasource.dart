import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const _keyJwt = 'KEY_JWT';
const _keyUserId = 'KEY_USER_ID';

abstract class StorageDatasource {
  Future<String?> get jwt;

  Future<String?> get userId;

  Future<void> storeJwt(String jwt);

  Future<void> storeUserId(String userId);

  Future<void> clearAllStorage();
}

@Singleton(as: StorageDatasource)
class StorageDatasourceImpl implements StorageDatasource {
  StorageDatasourceImpl({required FlutterSecureStorage secureStorage})
      : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> clearAllStorage() => _secureStorage.deleteAll();

  @override
  Future<String?> get jwt => _secureStorage.read(key: _keyJwt);

  @override
  Future<String?> get userId => _secureStorage.read(key: _keyUserId);

  @override
  Future<void> storeJwt(String jwt) =>
      _secureStorage.write(key: _keyJwt, value: jwt);

  @override
  Future<void> storeUserId(String userId) =>
      _secureStorage.write(key: _keyJwt, value: userId);
}
