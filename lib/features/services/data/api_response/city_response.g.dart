// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResposne _$CityResposneFromJson(Map<String, dynamic> json) => CityResposne(
      json['success'] as bool,
      (json['data'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String,
    );

Map<String, dynamic> _$CityResposneToJson(CityResposne instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
