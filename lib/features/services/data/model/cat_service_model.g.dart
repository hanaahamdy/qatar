// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesServiceModel _$CategoriesServiceModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesServiceModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      serviceId: json['service_id'] as int?,
    );

Map<String, dynamic> _$CategoriesServiceModelToJson(
        CategoriesServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'service_id': instance.serviceId,
    };
