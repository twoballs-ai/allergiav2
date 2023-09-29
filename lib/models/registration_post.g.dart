// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationResponse _$RegistrationResponseFromJson(
        Map<String, dynamic> json) =>
    RegistrationResponse(
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      username: (json['username'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      password: (json['password'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      password2: (json['password2'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      message: json['message'] as String?,
    )..DATA = json['DATA'];

Map<String, dynamic> _$RegistrationResponseToJson(
        RegistrationResponse instance) =>
    <String, dynamic>{
      'DATA': instance.DATA,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'password2': instance.password2,
      'message': instance.message,
    };
