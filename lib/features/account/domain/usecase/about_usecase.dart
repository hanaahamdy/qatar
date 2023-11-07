

import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../services/domain/entity/add_service_entity.dart';
import '../entity/about_entity.dart';
import '../repository/account_repository.dart';

class AboutServiceUseCase
    implements UseCase<AboutEntity, NoParams> {
  final AccountRepository _repository;

  AboutServiceUseCase(this._repository);

  @override
  Future<Result<BaseError, AboutEntity>> call(NoParams params) {
    return _repository.getAbout();
  }
}
