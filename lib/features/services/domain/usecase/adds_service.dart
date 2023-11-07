
import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/add_request.dart';
import '../entity/add_service_entity.dart';
import '../repository/services_repository.dart';

class GetAddsServiceUseCase implements UseCase<List<AddServiceEntity>, GetAddsServiceParams> {

  final ServicesRepository _repository;

  GetAddsServiceUseCase(this._repository);

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> call(GetAddsServiceParams params) =>
      _repository.getAddsService(addRequest: AddRequest(serviceId: params.serviceId!, categoryId: params.categoryId!));

}

class GetAddsServiceParams  extends BaseParams{
  final int? serviceId;
  final int? categoryId;
  GetAddsServiceParams({this.serviceId,this.categoryId, required CancelToken cancelToken}) : super(cancelToken: cancelToken);

}