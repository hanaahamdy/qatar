

import '../../../../core/entities/base_entity.dart';

class CategoriesServiceEntity extends BaseEntity{

  final int? id;
  final String? name;
  final int? serviceId;


  CategoriesServiceEntity(this.id, this.name, this.serviceId);

  @override
  List<Object?> get props => [
    id, name, serviceId
  ];
}