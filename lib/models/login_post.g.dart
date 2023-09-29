// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      password: (json['password'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'email': instance.email,
      'password': instance.password,
      'detail': instance.detail,
    };
