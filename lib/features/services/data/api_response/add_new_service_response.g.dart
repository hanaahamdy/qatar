// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewServiceResponse _$AddNewServiceResponseFromJson(
        Map<String, dynamic> json) =>
    AddNewServiceResponse(
      json['success'] as bool,
      ServiceDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String?,
    );

Map<String, dynamic> _$AddNewServiceResponseToJson(
        AddNewServiceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
