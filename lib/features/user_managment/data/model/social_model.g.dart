// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialModel _$SocialModelFromJson(Map<String, dynamic> json) => SocialModel(
      name: json['name'] as String?,
      id: json['id'] as int?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SocialModelToJson(SocialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'token': instance.token,
    };
