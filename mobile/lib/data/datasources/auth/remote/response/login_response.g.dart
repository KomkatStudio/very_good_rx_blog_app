// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['jwt', 'id', 'message'],
        );
        final val = LoginResponse(
          jwt: $checkedConvert('jwt', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as String?),
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );
