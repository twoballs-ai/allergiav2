import 'package:json_annotation/json_annotation.dart';
part 'registration_post.g.dart';

@JsonSerializable()
class RegistrationResponse {
  var DATA;

  RegistrationResponse({
    required this.email,
    required this.username,
    required this.password,
    required this.password2,
    required this.message,
  });

  List<String>? email;
  List<String>? username;
  List<String>? password;
  List<String>? password2;
  String? message;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}
