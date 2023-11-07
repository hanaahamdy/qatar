// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      code: json['code'] as int?,
      user: json['user'] == null ? null : User.fromJson(json['user']),
    )
      ..data = json['data']
      ..success = json['success'] as bool?;

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'user': instance.user,
      'data': instance.data,
      'success': instance.success,
    };
