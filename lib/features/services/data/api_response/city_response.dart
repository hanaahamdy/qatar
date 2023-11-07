
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/message_api_response.dart';
import '../model/city_model.dart';
part 'city_response.g.dart';


@JsonSerializable()
class CityResposne extends MessageApiResponse<List<CityModel>> {

  CityResposne(
      bool success,
      List<CityModel> data,
      String message
      ) : super(success, data, message);

  factory CityResposne.fromJson(Map<String, dynamic> json) =>
      _$CityResposneFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$CityResposneToJson(this);

}