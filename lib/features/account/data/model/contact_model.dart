import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/base_model.dart';
import '../../domain/entity/contact_entity.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel extends BaseModel<ContactEntity>{

  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? phone;
  final String? email;
  final String? message;

  ContactModel({this.fullName, this.message, this.phone, this.email});

  factory  ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
  @override
  ContactEntity toEntity() {
    return ContactEntity(

    );
  }
}