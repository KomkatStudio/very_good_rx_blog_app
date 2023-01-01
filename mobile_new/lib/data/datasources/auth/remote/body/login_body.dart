import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable(
  checked: true,
  createFactory: false,
  fieldRename: FieldRename.snake,
)
class LoginBody {
  LoginBody({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}
