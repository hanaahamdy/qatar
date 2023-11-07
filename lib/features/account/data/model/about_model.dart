

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/about_entity.dart';

part 'about_model.g.dart';

@JsonSerializable()
class AboutModel extends BaseModel<AboutEntity>{

  final String? slug;
  final String? body;

  AboutModel({required this.slug, required this.body});


  factory  AboutModel.fromJson(Map<String, dynamic> json) =>
      _$AboutModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AboutModelToJson(this);

  @override
  AboutEntity toEntity(){
    return AboutEntity(slug: slug, body: body);
  }
}