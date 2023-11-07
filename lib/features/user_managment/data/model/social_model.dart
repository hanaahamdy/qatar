
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entities/social_entity.dart';

part 'social_model.g.dart';

@JsonSerializable()
class SocialModel extends BaseModel<SocialEntity>{


  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? token;

  SocialModel({this.name, this.id, this.email, this.phone, this.token});

  factory SocialModel.fromJson(Map<String, dynamic> json) =>
      _$SocialModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$SocialModelToJson(this);

  @override
  SocialEntity toEntity() {
   return SocialEntity(
     token: token,
     email: email,
     id: id
   );
  }


}