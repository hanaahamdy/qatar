
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/response/api_response.dart';
import '../model/cat_service_model.dart';

part 'categories_service_response.g.dart';


@JsonSerializable()
class CategoriesServicesResponse extends ApiResponse<List<CategoriesServiceModel>> {


  CategoriesServicesResponse(
      bool success,
      List<CategoriesServiceModel> data,
      ) : super(success, data);

  factory CategoriesServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesServicesResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CategoriesServicesResponseToJson(this);

}