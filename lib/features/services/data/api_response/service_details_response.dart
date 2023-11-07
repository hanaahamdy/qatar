
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/api_response.dart';
import '../model/service_details_model.dart';

part 'service_details_response.g.dart';

@JsonSerializable()
class ServiceDetailsResponse extends ApiResponse<ServiceDetailsModel> {

  ServiceDetailsResponse(
      bool success,
      ServiceDetailsModel data,
      ) : super(success, data);

  factory ServiceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceDetailsResponseFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$ServiceDetailsResponseToJson(this);

}