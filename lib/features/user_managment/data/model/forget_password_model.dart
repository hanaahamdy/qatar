

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entities/forget_password_entity.dart';
import 'login_auth_model.dart';
part 'forget_password_model.g.dart';

@JsonSerializable()
class ForgetPasswordModel extends BaseModel<ForgetPasswordEntity>{
  final int? code;
  final LoginAuthModel? user;


  ForgetPasswordModel({
    this.code,
    this.user
});
  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ForgetPasswordModelToJson(this);

  @override
  ForgetPasswordEntity toEntity() {
    return ForgetPasswordEntity(
      code: code,
      user: user!.toEntity()
    );
  }

}