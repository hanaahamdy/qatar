
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entities/user_exist_entity.dart';

part 'user_existe.g.dart';

@JsonSerializable()
class UserExistModel extends BaseModel<UserExistEntity>{

  bool success;

  UserExistModel({required this.success});

  factory UserExistModel.fromJson(Map<String, dynamic> json) =>
      _$UserExistModelFromJson(json);

  @override
  UserExistEntity toEntity() {
    return UserExistEntity(success: success);
  }


}