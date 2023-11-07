
import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/add_construction_request.dart';
import '../entity/service_details_entity.dart';
import '../repository/services_repository.dart';

class AddConstructionUseCase implements UseCase<ServiceDetailsEntity, AddConstructionParams> {

  final ServicesRepository _repository;

  AddConstructionUseCase(this._repository);

  @override
  Future<Result<BaseError, ServiceDetailsEntity>> call(AddConstructionParams params) =>
      _repository.addConstruction(addConstructionRequest: params.data);
}


class AddConstructionParams extends BaseParams{
  AddConstructionRequest data;

  AddConstructionParams({required CancelToken cancelToken, required this.data}) : super(cancelToken: cancelToken);

}