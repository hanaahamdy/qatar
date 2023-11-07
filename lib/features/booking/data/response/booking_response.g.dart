// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResposne _$BookingResposneFromJson(Map<String, dynamic> json) =>
    BookingResposne(
      json['success'] as bool,
      BookingModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String,
    );

Map<String, dynamic> _$BookingResposneToJson(BookingResposne instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
