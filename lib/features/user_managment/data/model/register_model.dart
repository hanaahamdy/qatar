
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../../../core/response/base_response.dart';
import '../../../services/data/model/add_service_model.dart';
import '../../domain/entities/register_entity.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseModel<RegisterEntity>{

  final int? code;
  final User? user;

  RegisterModel({this.code, this.user});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  @override
  RegisterEntity toEntity() {
    return RegisterEntity(
      code: code,
      user: user
    );
  }

  @override
  var data;
  @override
  bool? success;
}