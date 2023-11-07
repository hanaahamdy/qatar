import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/api_response.dart';
import '../model/comment_service_model.dart';

part 'add_comment_service_response.g.dart';


@JsonSerializable()
class AddComentsServiceResponse extends ApiResponse<CommentServiceModel> {

  AddComentsServiceResponse(
      bool success,
      CommentServiceModel data,
      ) : super(success, data);

  factory AddComentsServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$AddComentsServiceResponseFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$AddComentsServiceResponseToJson(this);

}