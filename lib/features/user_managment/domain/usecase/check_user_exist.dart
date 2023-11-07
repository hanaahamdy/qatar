
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/api_requests/login_request.dart';
import '../../data/api_requests/user_request.dart';
import '../entities/login_entity.dart';
import '../entities/user_exist_entity.dart';
import '../repository/user_managment_repository.dart';

class CheckUserUseCase implements UseCase<UserExistEntity, UserParams> {

  final UserManagementRepository _repository;

  CheckUserUseCase(this._repository);

  @override
  Future<Result<BaseError, UserExistEntity>>  call(UserParams params) => _repository.checkUserExistence(
      userRequest: params.data
  );

}

class UserParams extends BaseParams{
  UserRequest data;
  CancelToken cancelToken;

  UserParams({required this.data, required this.cancelToken}): super(cancelToken: cancelToken);
}
