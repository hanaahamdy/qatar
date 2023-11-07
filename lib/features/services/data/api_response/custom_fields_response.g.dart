// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_fields_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomFieldsResposne _$CustomFieldsResposneFromJson(
        Map<String, dynamic> json) =>
    CustomFieldsResposne(
      json['success'] as bool,
      (json['data'] as List<dynamic>)
          .map((e) => CustomFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String,
    );

Map<String, dynamic> _$CustomFieldsResposneToJson(
        CustomFieldsResposne instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
