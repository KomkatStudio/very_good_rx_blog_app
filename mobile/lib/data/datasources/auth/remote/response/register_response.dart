import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: true,
  createToJson: false,
)
class RegisterResponse {
  const RegisterResponse({
    this.username,
    this.firstName,
    this.lastName,
    this.id,
    this.avatar,
    this.followerCount,
    this.followingCount,
    this.numBlog,
  });
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
      
  final String? username;
  final String? firstName;
  final String? lastName;
  @JsonKey(name: '_id')
  final String? id;
  final String? avatar;
  final int? followerCount;
  final int? followingCount;
  final int? numBlog;
}
