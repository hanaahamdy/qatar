// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddServiceResponse _$AddServiceResponseFromJson(Map<String, dynamic> json) =>
    AddServiceResponse(
      json['success'] as bool,
      (json['data'] as List<dynamic>)
          .map((e) => AddServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddServiceResponseToJson(AddServiceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
