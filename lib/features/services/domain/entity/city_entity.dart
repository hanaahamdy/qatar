


import '../../../../core/entities/base_entity.dart';
import '../../data/model/city_model.dart';

class CityEntity extends BaseEntity{
  int? id;
  String? name;
  int? countryId;
  Country? country;


  CityEntity({this.id, this.name, this.countryId, this.country});

  @override
  List<Object?> get props => [
    id,
    name, country, countryId
  ];

}