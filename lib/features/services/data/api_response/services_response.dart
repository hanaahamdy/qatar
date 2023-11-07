import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/api_response.dart';
import '../model/add_service_model.dart';
import '../model/services_model.dart';

part 'services_response.g.dart';


@JsonSerializable()
class ServicesResponse extends ApiResponse<List<ServicesModel>> {


  ServicesResponse(
      bool success,
      List<ServicesModel> data,
      ) : super(success, data);

  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);

}