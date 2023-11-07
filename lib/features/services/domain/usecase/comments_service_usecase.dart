/*

import 'package:dio/dio.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/categories_service_request.dart';
import '../../data/request/comment_service_request.dart';
import '../entity/comment_service_entity.dart';
import '../repository/services_repository.dart';

class GetCommentsServicesUseCase implements UseCase<List<CommentServiceEntity>, GetCommentsServiceParams> {
  final ServicesRepository _repository;

  GetCommentsServicesUseCase(this._repository);

  @override
  Future<Result<BaseError, List<CommentServiceEntity>>> call(GetCommentsServiceParams params) =>
      _repository.getCommentsService(commentServiceRequest : CommentServiceRequest(serviceId: params.serviceId));
}

class GetCommentsServiceParams extends BaseParams{
  final int serviceId;
  final CancelToken cancelToken;

  GetCommentsServiceParams({required this.serviceId, required this.cancelToken}) : super(cancelToken: cancelToken);

}*/
