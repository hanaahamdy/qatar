import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/api_response.dart';
import '../model/comment_service_model.dart';

part 'comments_service_response.g.dart';


@JsonSerializable()
class CoomentsServiceResponse extends ApiResponse<List<CommentServiceModel>> {

  CoomentsServiceResponse(
      bool success,
      List<CommentServiceModel> data,
      ) : super(success, data);

  factory CoomentsServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$CoomentsServiceResponseFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$CoomentsServiceResponseToJson(this);

}