
import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/add_construction_request.dart';
import '../../data/request/custom_field_request.dart';
import '../entity/custom_field_entity.dart';
import '../repository/services_repository.dart';

class CustomFieldsUseCase implements UseCase<List<CustomFieldEntity>, CustomFieldsParams> {

  final ServicesRepository _repository;

  CustomFieldsUseCase(this._repository);

  @override
  Future<Result<BaseError, List<CustomFieldEntity>>> call(CustomFieldsParams params) =>
      _repository.getCustomFields(customFieldsRequest: params.data);
}


class CustomFieldsParams extends BaseParams{
  CustomFieldsRequest data;

  CustomFieldsParams({required CancelToken cancelToken, required this.data}) : super(cancelToken: cancelToken);

}