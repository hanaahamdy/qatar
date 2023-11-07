
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/categories_service_entity.dart';

part 'cat_service_model.g.dart';


@JsonSerializable()
class CategoriesServiceModel extends BaseModel<CategoriesServiceEntity>{

  final int? id;
  final String? name;
  @JsonKey(name: 'service_id')
  final int? serviceId;

  CategoriesServiceModel({this.id, this.name, required this.serviceId});


  factory CategoriesServiceModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesServiceModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CategoriesServiceModelToJson(this);

  @override
  toEntity() {
    return CategoriesServiceEntity(id, name, serviceId);
  }

}