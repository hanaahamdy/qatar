// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) => GalleryModel(
      title: json['title'] as String?,
      image: json['image'] as String?,
      id: json['id'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$GalleryModelToJson(GalleryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'url': instance.url,
    };
