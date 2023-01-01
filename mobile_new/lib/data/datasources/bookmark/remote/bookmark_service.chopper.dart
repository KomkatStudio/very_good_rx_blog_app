// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$BookmarkService extends BookmarkService {
  _$BookmarkService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BookmarkService;

  @override
  Future<Response<dynamic>> getBookmarks() {
    final Uri $url = Uri.parse('/api/v1/bookmarks');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addBookmark() {
    final Uri $url = Uri.parse('/api/v1/bookmarks');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteBookmark() {
    final Uri $url = Uri.parse('/api/v1/bookmarks');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
