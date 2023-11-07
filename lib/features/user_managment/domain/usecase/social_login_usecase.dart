
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/api_requests/login_request.dart';
import '../../data/api_requests/social_login_request.dart';
import '../entities/login_entity.dart';
import '../entities/social_entity.dart';
import '../repository/user_managment_repository.dart';

class SocialLoginUseCase implements UseCase<SocialEntity, SocialLoginParams> {

  final UserManagementRepository _repository;

  SocialLoginUseCase(this._repository);

  @override
  Future<Result<BaseError, SocialEntity>> call(SocialLoginParams params) => _repository.socialLogin(
      socialLoginRequest: params.data
  );

}

class SocialLoginParams extends BaseParams{
  SocialLoginRequest data;
  CancelToken cancelToken;

  SocialLoginParams({required this.data, required this.cancelToken}): super(cancelToken: cancelToken);
}
