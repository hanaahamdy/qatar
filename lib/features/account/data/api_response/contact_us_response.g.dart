// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsResposne _$ContactUsResposneFromJson(Map<String, dynamic> json) =>
    ContactUsResposne(
      json['success'] as bool,
      ContactModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String,
    );

Map<String, dynamic> _$ContactUsResposneToJson(ContactUsResposne instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
