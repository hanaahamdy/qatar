import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/settings_entity.dart';

part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel extends BaseModel<SettingsEntity>{

  final int? id;
  final String? name;
  final String? value;

  SettingsModel({
    this.id,
    this.name,
    this.value
  });

  factory  SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  @override
  SettingsEntity toEntity() {
    return SettingsEntity(
      id: id,
      name: name,
      value: value
    );
  }

}