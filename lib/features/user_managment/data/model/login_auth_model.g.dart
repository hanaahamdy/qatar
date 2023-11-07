// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAuthModel _$LoginAuthModelFromJson(Map<String, dynamic> json) =>
    LoginAuthModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginAuthModelToJson(LoginAuthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'token': instance.token,
    };
