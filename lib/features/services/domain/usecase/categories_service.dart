
import 'package:dio/dio.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/categories_service_request.dart';
import '../entity/categories_service_entity.dart';
import '../repository/services_repository.dart';

class GetCategouriesServicesUseCase implements UseCase<List<CategoriesServiceEntity>, GetCategouriesServicesParams> {
  final ServicesRepository _repository;

  GetCategouriesServicesUseCase(this._repository);

  @override
  Future<Result<BaseError, List<CategoriesServiceEntity>>> call(GetCategouriesServicesParams params) =>
      _repository.getCategoriesServices(request:CategoriesServiceRequest(serviceId: params.serviceId));

}

class GetCategouriesServicesParams extends BaseParams{
  final int serviceId;
  final CancelToken cancelToken;

  GetCategouriesServicesParams({required this.serviceId, required this.cancelToken}) : super(cancelToken: cancelToken);

}