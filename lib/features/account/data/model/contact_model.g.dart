// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      fullName: json['full_name'] as String?,
      message: json['message'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'message': instance.message,
    };
