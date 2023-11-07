// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsResposne _$SettingsResposneFromJson(Map<String, dynamic> json) =>
    SettingsResposne(
      json['success'] as bool,
      (json['data'] as List<dynamic>)
          .map((e) => SettingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String,
    );

Map<String, dynamic> _$SettingsResposneToJson(SettingsResposne instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
