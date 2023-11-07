// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDetailsResponse _$ServiceDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ServiceDetailsResponse(
      json['success'] as bool,
      ServiceDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceDetailsResponseToJson(
        ServiceDetailsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
