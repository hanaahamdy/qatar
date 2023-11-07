


import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entity/services_entity.dart';
import '../repository/services_repository.dart';

class GetServicesUseCase implements UseCase<List<ServicesEntity>, NoParams> {
  final ServicesRepository _repository;

  GetServicesUseCase(this._repository);

  @override
  Future<Result<BaseError, List<ServicesEntity>>> call(NoParams params) => _repository.getServices();

}