// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutResposne _$AboutResposneFromJson(Map<String, dynamic> json) =>
    AboutResposne(
      json['success'] as bool,
      AboutModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String,
    );

Map<String, dynamic> _$AboutResposneToJson(AboutResposne instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
