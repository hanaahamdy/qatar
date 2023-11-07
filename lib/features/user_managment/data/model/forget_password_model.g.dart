// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordModel _$ForgetPasswordModelFromJson(Map<String, dynamic> json) =>
    ForgetPasswordModel(
      code: json['code'] as int?,
      user: json['user'] == null
          ? null
          : LoginAuthModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForgetPasswordModelToJson(
        ForgetPasswordModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'user': instance.user,
    };
