// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      adId: json['ad_id'] as int?,
      bookingDate: json['booking_date'] as String?,
      persons: json['persons'] as String?,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'ad_id': instance.adId,
      'booking_date': instance.bookingDate,
      'persons': instance.persons,
    };
