// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) =>
    ServicesModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      sort: json['sort'] as int?,
      active: json['active'] as bool?,
      count: json['ads_count'] as int?,
    );

Map<String, dynamic> _$ServicesModelToJson(ServicesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'sort': instance.sort,
      'active': instance.active,
      'ads_count': instance.count,
    };
