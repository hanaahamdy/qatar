
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/custom_field_entity.dart';
import 'add_service_model.dart';

part 'custom_filel_model.g.dart';

@JsonSerializable()
class CustomFieldModel extends BaseModel<CustomFieldEntity>{

  int? id;
  int? serviceId;
  Service? service;
  String? type;
  String? name;
  dynamic defaultValue;
  @JsonKey(name: 'label_title')
  String? labelTitle;
  String? validation;
  int? order;
  final String? value;

  CustomFieldModel({
    this.id,
    this.serviceId,
    this.service,
    this.type,
    this.name,
    this.defaultValue,
    this.labelTitle,
    this.validation,
    this.order,
   this.value});

  factory CustomFieldModel.fromJson(Map<String, dynamic> json) =>
      _$CustomFieldModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CustomFieldModelToJson(this);

  @override
  CustomFieldEntity toEntity() {
    return CustomFieldEntity(
      id: id,
      name: name,
      serviceId: serviceId,
      labelTitle: labelTitle,
      type: type,
      value: value
    );
  }


}

/*
class Service {
  Service({
    this.id,
    this.name,
    this.icon,
    this.sort,
    this.active,});

  Service.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    sort = json['sort'];
    active = json['active'];
  }
  int? id;
  String? name;
  String? icon;
  int? sort;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['sort'] = sort;
    map['active'] = active;
    return map;
  }

}*/
