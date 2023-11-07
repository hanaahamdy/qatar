

import 'package:dio/src/cancel_token.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entity/city_entity.dart';
import '../repository/services_repository.dart';

class CitiesUseCase implements UseCase<List<CityEntity>, NoParams> {

  final ServicesRepository _repository;

  CitiesUseCase(this._repository);

  @override
  Future<Result<BaseError, List<CityEntity>>> call(NoParams params) =>
      _repository.getCities();
}
