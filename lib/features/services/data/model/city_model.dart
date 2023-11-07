
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/city_entity.dart';


part 'city_model.g.dart';

@JsonSerializable()
class CityModel  extends BaseModel<CityEntity>{

  int? id;
  String? name;
  int? countryId;
  Country? country;

  CityModel({
      this.id, 
      this.name, 
      this.countryId, 
      this.country,});


  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  CityEntity toEntity() {
    return CityEntity(name: name,
      id: id, country: country, countryId: countryId

    );
  }

}

class Country {
  Country({
    this.id,
    this.name,});

  Country.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}