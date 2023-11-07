import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/api_requests/Register_request.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../repository/user_managment_repository.dart';

class RegisterUseCase implements UseCase<LoginEntity, RegisterParams> {
  final UserManagementRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Result<BaseError, LoginEntity>> call(RegisterParams params) =>
      _repository.register(registerRequest: params.data);
}

class RegisterParams extends BaseParams {
  RegisterRequest data;
  CancelToken cancelToken;

  RegisterParams({required this.data, required this.cancelToken}) : super(cancelToken: cancelToken);
}
