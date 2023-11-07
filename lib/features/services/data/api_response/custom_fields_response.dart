
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/message_api_response.dart';
import '../model/custom_filel_model.dart';

part 'custom_fields_response.g.dart';

@JsonSerializable()
class CustomFieldsResposne extends MessageApiResponse<List<CustomFieldModel>> {

  CustomFieldsResposne(
      bool success,
      List<CustomFieldModel> data,
      String message
      ) : super(success, data, message);

  factory CustomFieldsResposne.fromJson(Map<String, dynamic> json) =>
      _$CustomFieldsResposneFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$CustomFieldsResposneToJson(this);

}