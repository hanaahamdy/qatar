
import 'package:dio/dio.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/categories_service_request.dart';
import '../../data/request/service_details_request.dart';
import '../entity/service_details_entity.dart';
import '../repository/services_repository.dart';

class GetServiceDetailsUseCase implements UseCase<ServiceDetailsEntity, ServiceDetailsParams> {
  final ServicesRepository _repository;

  GetServiceDetailsUseCase(this._repository);

  @override
  Future<Result<BaseError, ServiceDetailsEntity>> call(ServiceDetailsParams params) =>
      _repository.getServiceDetails(serviceDetailsRequest: ServiceDetailsRequest(serviceId: params.serviceId));

}

class ServiceDetailsParams extends BaseParams{
  final int serviceId;
  final CancelToken cancelToken;

  ServiceDetailsParams({required this.serviceId, required this.cancelToken}) : super(cancelToken: cancelToken);

}