// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      countryId: json['countryId'] as int?,
      country:
          json['country'] == null ? null : Country.fromJson(json['country']),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'countryId': instance.countryId,
      'country': instance.country,
    };
