
import '../../../../core/entities/base_entity.dart';

class SettingsEntity extends BaseEntity{
  final int? id;
  final String? name;
  final String? value;

  SettingsEntity({
    this.id,
    this.name,
    this.value
});

  @override
  List<Object?> get props => [id, name, value];
}