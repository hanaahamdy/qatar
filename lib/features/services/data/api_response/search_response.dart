
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/api_response.dart';
import '../../../../core/response/message_api_response.dart';
import '../model/add_service_model.dart';

part 'search_response.g.dart';


@JsonSerializable()
class SearchResponse extends MessageApiResponse<List<AddServiceModel>> {

  SearchResponse(
      bool success,
      List<AddServiceModel> data,
      String message
      ) : super(success,  data, message);

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);

}