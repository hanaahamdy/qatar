import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/gallery_entity.dart';

part 'gallery_model.g.dart';

@JsonSerializable()
class GalleryModel extends BaseModel<GalleryEntity>{
  final int? id;
  final String? title;
  final String? image;
  final String? url;

  GalleryModel({this.title, this.image, this.id, this.url});

  factory  GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);

  @override
  GalleryEntity toEntity() {
    return GalleryEntity(
      id: id,
      image: image,
      title: title
    );
  }
}