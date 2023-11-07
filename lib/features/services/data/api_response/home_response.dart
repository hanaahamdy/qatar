
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/message_api_response.dart';
import '../model/gallery_model.dart';

part 'home_response.g.dart';

@JsonSerializable()
class Homesponse extends MessageApiResponse<List<GalleryModel>>{

  Homesponse(bool success,List<GalleryModel> data, String message) : super(success, data, message);

  factory Homesponse.fromJson(Map<String, dynamic> json) =>
      _$HomesponseFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$HomesponseToJson(this);


}