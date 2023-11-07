
import 'package:dio/src/cancel_token.dart';
import '../../../../core/entities/empty_entity.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/service_details_request.dart';
import '../repository/services_repository.dart';

class AddFavoriteUseCase implements UseCase<EmptyEntity, AddFavoriteParams> {

  final ServicesRepository _repository;

  AddFavoriteUseCase(this._repository);

  @override
  Future<Result<BaseError, EmptyEntity>> call(AddFavoriteParams params) =>
      _repository.addFavorite(serviceDetailsRequest: params.data);
}


class AddFavoriteParams extends BaseParams{
  ServiceDetailsRequest data;

  AddFavoriteParams({required CancelToken cancelToken, required this.data}) : super(cancelToken: cancelToken);

}