

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/message_api_response.dart';
import '../model/contact_model.dart';

part 'contact_us_response.g.dart';

@JsonSerializable()
class ContactUsResposne extends MessageApiResponse<ContactModel>{


  ContactUsResposne(bool success,ContactModel data, String message)
      : super(success, data, message);


  factory ContactUsResposne.fromJson(Map<String, dynamic> json) =>
      _$ContactUsResposneFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$ContactUsResposneToJson(this);



}