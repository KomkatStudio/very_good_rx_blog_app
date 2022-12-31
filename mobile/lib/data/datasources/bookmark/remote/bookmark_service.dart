import 'package:chopper/chopper.dart';

part 'bookmark_service.chopper.dart';

abstract class BookmarkService extends ChopperService {
  static BookmarkService create([ChopperClient? client]) =>
      _$BookmarkService(client);
}
