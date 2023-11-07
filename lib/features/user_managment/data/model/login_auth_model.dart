
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entities/login_entity.dart';


part 'login_auth_model.g.dart';


@JsonSerializable()
class LoginAuthModel  extends BaseModel<LoginEntity>{

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  String? email;
  String? phone;
   String? token;

  LoginAuthModel({
      this.id,
      this.name,
      this.email,
      this.phone,
    this.token,
  });

  factory LoginAuthModel.fromJson(Map<String, dynamic> json) =>
      _$LoginAuthModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$LoginAuthModelToJson(this);

  @override
  LoginEntity toEntity() => LoginEntity(
    name: name,
    id: id,
    email: email,
    token: token,
    phone: phone,
  );

}