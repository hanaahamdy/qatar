

import '../../../../core/entities/base_entity.dart';

class ServicesEntity extends BaseEntity{

  final int? id;
  final String? name;
  final String? icon;
  final int? sort;
  final bool? active;
  final int? count;

  ServicesEntity({this.id, this.name, this.icon, this.sort, this.active, this.count});

  @override
  List<Object?> get props => [
    id,
    name,
    icon, sort, active,
    count
  ];

}
