
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/message_api_response.dart';
import '../model/about_model.dart';

part 'about_response.g.dart';

@JsonSerializable()
class AboutResposne extends MessageApiResponse<AboutModel>{


  AboutResposne(bool success,AboutModel data, String message)
      : super(success, data, message);


  factory AboutResposne.fromJson(Map<String, dynamic> json) =>
      _$AboutResposneFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$AboutResposneToJson(this);



}