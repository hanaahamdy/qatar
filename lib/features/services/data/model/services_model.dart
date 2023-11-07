

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/services_entity.dart';

part  'services_model.g.dart';

@JsonSerializable()
class ServicesModel extends BaseModel<ServicesEntity>{

  @JsonKey(name:"id")
  final int? id;
  @JsonKey(name:"name")
  final String? name;
  @JsonKey(name:"icon")
  final String? icon;
  @JsonKey(name:"sort")
  final int? sort;
  @JsonKey(name:"active")
  final bool? active;
  @JsonKey(name: 'ads_count')
  final int? count;


  ServicesModel({this.id, this.name, this.icon, this.sort, this.active, this.count});

  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ServicesModelToJson(this);

  @override
  ServicesEntity toEntity() {
    return ServicesEntity(
      id: id,
      name: name,
      sort: sort,
      icon: icon,
      active: active,
      count: count
    );
  }


}