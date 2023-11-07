// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    SettingsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
