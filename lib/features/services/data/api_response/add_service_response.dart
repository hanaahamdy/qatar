import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/api_response.dart';
import '../model/add_service_model.dart';

part 'add_service_response.g.dart';


@JsonSerializable()
class AddServiceResponse extends ApiResponse<List<AddServiceModel>> {

  AddServiceResponse(
      bool success,
      List<AddServiceModel> data,
      ) : super(success, data);

  factory AddServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$AddServiceResponseFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$AddServiceResponseToJson(this);

}