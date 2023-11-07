
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/api_response.dart';
import '../../../../core/response/message_api_response.dart';
import '../model/service_details_model.dart';

part 'add_new_service_response.g.dart';


@JsonSerializable()
class AddNewServiceResponse extends MessageApiResponse<ServiceDetailsModel> {

  AddNewServiceResponse(
      bool success,
      ServiceDetailsModel data,
      String? message
      ) : super(success, data, message!);


  factory AddNewServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNewServiceResponseFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$AddNewServiceResponseToJson(this);

}