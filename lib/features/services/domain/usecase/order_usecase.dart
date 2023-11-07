
import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/order_request.dart';
import '../entity/add_service_entity.dart';
import '../repository/services_repository.dart';

class OrderUseCase implements UseCase<List<AddServiceEntity>, OrderParams> {

  final ServicesRepository _repository;

  OrderUseCase(this._repository);

  @override
  Future<Result<BaseError, List<AddServiceEntity>>> call(OrderParams params) =>
      _repository.getOrderServices(orderRequest: params.data);
}


class OrderParams extends BaseParams{
  OrderRequest data;

  OrderParams({required CancelToken cancelToken, required this.data}) : super(cancelToken: cancelToken);

}