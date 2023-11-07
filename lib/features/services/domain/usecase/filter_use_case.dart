
import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/filter_request.dart';
import '../entity/add_service_entity.dart';
import '../repository/services_repository.dart';

class FilterUseCase implements UseCase<List<AddServiceEntity>, FilterParams> {

  final ServicesRepository _repository;

  FilterUseCase(this._repository);

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> call(FilterParams params) =>
      _repository.filterServices(filterRequest: params.data);
}


class FilterParams extends BaseParams{
  FilterRequest data;

  FilterParams({required CancelToken cancelToken, required this.data}) : super(cancelToken: cancelToken);

}