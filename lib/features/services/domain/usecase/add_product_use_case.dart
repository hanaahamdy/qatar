
import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/add_construction_request.dart';
import '../../data/request/add_product_request.dart';
import '../entity/service_details_entity.dart';
import '../repository/services_repository.dart';

class AddProductUseCase implements UseCase<ServiceDetailsEntity, AddProductParams> {

  final ServicesRepository _repository;

  AddProductUseCase(this._repository);

  @override
  Future<Result<BaseError, ServiceDetailsEntity>> call(AddProductParams params) =>
      _repository.addAddWithCustomFields(addProductRequest: params.data);
}


class AddProductParams extends BaseParams{
  AddProductRequest data;

  AddProductParams({required CancelToken cancelToken, required this.data}) : super(cancelToken: cancelToken);

}