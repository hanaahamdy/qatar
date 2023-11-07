// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddComentsServiceResponse _$AddComentsServiceResponseFromJson(
        Map<String, dynamic> json) =>
    AddComentsServiceResponse(
      json['success'] as bool,
      CommentServiceModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddComentsServiceResponseToJson(
        AddComentsServiceResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
