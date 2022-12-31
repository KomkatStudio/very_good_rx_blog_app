import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable(
  checked: true,
  createFactory: false,
  fieldRename: FieldRename.snake,
)
class RegisterBody {
  RegisterBody({
    required this.username,
    required this.password,
    required this.confirmationPassword,
    required this.firstName,
    required this.lastName,
  });
  final String username;
  final String password;
  final String confirmationPassword;
  final String firstName;
  final String lastName;

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);
}
