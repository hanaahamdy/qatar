


import '../../../../core/entities/base_entity.dart';
import '../../data/model/add_service_model.dart';

class CustomFieldEntity extends BaseEntity{

  int? id;
  int? serviceId;
  Service? service;
  String? type;
  String? name;
  dynamic defaultValue;
  String? labelTitle;
  String? validation;
  int? order;
  String? value;

  CustomFieldEntity({
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
  @override
  List<Object?> get props => [
    id,
    serviceId,
    service,
    name,
    labelTitle,
    validation,
    order,
    type,
    defaultValue,
    value
  ];

}