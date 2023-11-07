// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesServicesResponse _$CategoriesServicesResponseFromJson(
        Map<String, dynamic> json) =>
    CategoriesServicesResponse(
      json['success'] as bool,
      (json['data'] as List<dynamic>)
          .map(
              (e) => CategoriesServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesServicesResponseToJson(
        CategoriesServicesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
