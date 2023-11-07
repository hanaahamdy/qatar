// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentServiceModel _$CommentServiceModelFromJson(Map<String, dynamic> json) =>
    CommentServiceModel(
      json['id'] as int?,
      json['user_id'] as int?,
      json['ad_id'] as int?,
      json['comment'] as String?,
      json['active'] as bool?,
      json['user'] == null ? null : User.fromJson(json['user']),
      json['created_at'] as String?,
    );

Map<String, dynamic> _$CommentServiceModelToJson(
        CommentServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'ad_id': instance.adId,
      'comment': instance.comment,
      'active': instance.active,
      'user': instance.user,
      'created_at': instance.createdAt,
    };
