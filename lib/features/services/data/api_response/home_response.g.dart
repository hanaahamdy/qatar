// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Homesponse _$HomesponseFromJson(Map<String, dynamic> json) => Homesponse(
      json['success'] as bool,
      (json['data'] as List<dynamic>)
          .map((e) => GalleryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String,
    );

Map<String, dynamic> _$HomesponseToJson(Homesponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
