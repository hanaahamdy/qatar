


import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entity/settings_entity.dart';
import '../repository/account_repository.dart';

class SettingsUseCase
    implements UseCase<List<SettingsEntity>, NoParams> {
  final AccountRepository _repository;

  SettingsUseCase(this._repository);

  @override
  Future<Result<BaseError, List<SettingsEntity>>> call(NoParams params) {
    return _repository.getSettings();
  }
}