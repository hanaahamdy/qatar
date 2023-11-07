// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_filel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomFieldModel _$CustomFieldModelFromJson(Map<String, dynamic> json) =>
    CustomFieldModel(
      id: json['id'] as int?,
      serviceId: json['serviceId'] as int?,
      service:
          json['service'] == null ? null : Service.fromJson(json['service']),
      type: json['type'] as String?,
      name: json['name'] as String?,
      defaultValue: json['defaultValue'],
      labelTitle: json['label_title'] as String?,
      validation: json['validation'] as String?,
      order: json['order'] as int?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CustomFieldModelToJson(CustomFieldModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceId': instance.serviceId,
      'service': instance.service,
      'type': instance.type,
      'name': instance.name,
      'defaultValue': instance.defaultValue,
      'label_title': instance.labelTitle,
      'validation': instance.validation,
      'order': instance.order,
      'value': instance.value,
    };
