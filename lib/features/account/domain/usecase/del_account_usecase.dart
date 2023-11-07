

import '../../../../core/entities/empty_entity.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repository/account_repository.dart';

class DelAccountUseCase
    implements UseCase<Object, NoParams> {
  final AccountRepository _repository;

  DelAccountUseCase(this._repository);

  @override
  Future<Result<BaseError, Object>> call(NoParams params) {
    return _repository.deleteAccount();
  }
}
