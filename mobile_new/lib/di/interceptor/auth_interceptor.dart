import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:very_good_rx_blog_app/data/datasources/storage/storage_datasource.dart';

class AppAuthenticator implements Authenticator {
  AppAuthenticator({required StorageDatasource storageDatasource})
      : _storageDatasource = storageDatasource;

  final StorageDatasource _storageDatasource;

  @override
  Future<Request?> authenticate(
    Request request,
    Response response, [
    Request? originalRequest,
  ]) async {
    final token = await _buildToken();
    if (token == null) return request;
    return request.copyWith(
      headers: request.headers
        ..putIfAbsent(HttpHeaders.authorizationHeader, () => token),
    );
  }

  Future<String?> _buildToken() async {
    final token = await _storageDatasource.jwt;
    if (token == null) return null;
    return 'Bearer $token';
  }
}
