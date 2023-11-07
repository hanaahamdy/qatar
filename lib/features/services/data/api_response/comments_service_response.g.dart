// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoomentsServiceResponse _$CoomentsServiceResponseFromJson(
        Map<String, dynamic> json) =>
    CoomentsServiceResponse(
      json['success'] as bool,
      (json['data'] as List<dynamic>)
          .map((e) => CommentServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoomentsServiceResponseToJson(
        CoomentsServiceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
