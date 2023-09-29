import 'package:json_annotation/json_annotation.dart';
part 'login_post.g.dart';

@JsonSerializable()
class AuthResponse {
  AuthResponse({
    this.refresh,
    this.access,
    this.email,
    this.password,
    this.detail,
  });

  String? refresh;
  String? access;
  List<String?>? email;
  List<String?>? password;
  String? detail;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
