

import '../../../../core/entities/base_entity.dart';

class GalleryEntity extends BaseEntity{
  final int? id;
  final String? title;
  final String? image;
  final String? url;

  GalleryEntity({
    this.id,
    this.title,
    this.image,
    this.url
});

  @override
  List<Object?> get props => [
    id,
    title,
    image,
    url
  ];

}