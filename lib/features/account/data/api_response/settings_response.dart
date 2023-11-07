
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/message_api_response.dart';
import '../model/settings_model.dart';

part 'settings_response.g.dart';

@JsonSerializable()
class SettingsResposne extends MessageApiResponse<List<SettingsModel>>{


  SettingsResposne(bool success,List<SettingsModel> data, String message)
      : super(success, data, message);


  factory SettingsResposne.fromJson(Map<String, dynamic> json) =>
      _$SettingsResposneFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$SettingsResposneToJson(this);



}