
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/api_requests/login_request.dart';
import '../entities/login_entity.dart';
import '../repository/user_managment_repository.dart';

class LoginUseCase implements UseCase<LoginEntity, LoginParams> {

  final UserManagementRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Result<BaseError, LoginEntity>>  call(LoginParams params) => _repository.login(
     loginRequest: params.data
  );

}

class LoginParams extends BaseParams{
  LoginRequest data;
  CancelToken cancelToken;

  LoginParams({required this.data, required this.cancelToken}): super(cancelToken: cancelToken);
}
