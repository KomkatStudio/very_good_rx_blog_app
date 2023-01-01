// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'username',
            'firstName',
            'lastName',
            '_id',
            'avatar',
            'followerCount',
            'followingCount',
            'numBlog'
          ],
        );
        final val = RegisterResponse(
          username: $checkedConvert('username', (v) => v as String?),
          firstName: $checkedConvert('firstName', (v) => v as String?),
          lastName: $checkedConvert('lastName', (v) => v as String?),
          id: $checkedConvert('_id', (v) => v as String?),
          avatar: $checkedConvert('avatar', (v) => v as String?),
          followerCount: $checkedConvert('followerCount', (v) => v as int?),
          followingCount: $checkedConvert('followingCount', (v) => v as int?),
          numBlog: $checkedConvert('numBlog', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'id': '_id'},
    );
