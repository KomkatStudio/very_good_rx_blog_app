import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(
  createToJson: false,
  checked: true,
  disallowUnrecognizedKeys: true,
)
class LoginResponse {
  LoginResponse({
    required this.jwt,
    required this.id,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  final String? jwt;
  final String? id;
  final String message;
}
