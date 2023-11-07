
import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/add_request.dart';
import '../entity/add_service_entity.dart';
import '../repository/services_repository.dart';

class GetAllAddsServiceUseCase implements UseCase<List<AddServiceEntity>, GetAllAddsServiceParams> {

  final ServicesRepository _repository;

  GetAllAddsServiceUseCase(this._repository);

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> call(GetAllAddsServiceParams params) =>
      _repository.getAllAddsService(addRequest: params.data!);

}

class GetAllAddsServiceParams  extends BaseParams{
  final AddRequest? data;
  GetAllAddsServiceParams({this.data ,required CancelToken cancelToken}) : super(cancelToken: cancelToken);

}