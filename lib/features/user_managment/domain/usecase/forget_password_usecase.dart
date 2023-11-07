
import 'package:dio/dio.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/api_requests/forget_password_request.dart';
import '../entities/forget_password_entity.dart';
import '../repository/user_managment_repository.dart';

class ForgetPasswordUseCase implements UseCase<ForgetPasswordEntity, ForgetPassParams> {

  final UserManagementRepository _repository;

  ForgetPasswordUseCase(this._repository);

  @override
  Future<Result<BaseError, ForgetPasswordEntity>> call(ForgetPassParams params) => _repository.forgetPassword(
      forgetPasswordRequest: params.data
  );

}

class ForgetPassParams extends BaseParams{
  ForgetPasswordRequest data;
  CancelToken cancelToken;

  ForgetPassParams({required this.data, required this.cancelToken}): super(cancelToken: cancelToken);
}
