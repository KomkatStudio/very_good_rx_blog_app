import 'package:chopper/chopper.dart';

part 'bookmark_service.chopper.dart';

@ChopperApi(baseUrl: '/api/v1/bookmarks')
abstract class BookmarkService extends ChopperService {
  static BookmarkService create([ChopperClient? client]) =>
      _$BookmarkService(client);

  @Get()
  Future<Response> getBookmarks();

  @Post()
  Future<Response> addBookmark();

  @Delete()
  Future<Response> deleteBookmark();
}
