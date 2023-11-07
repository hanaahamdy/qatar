
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/api_requests/login_request.dart';
import '../../data/api_requests/social_register_request.dart';
import '../entities/login_entity.dart';
import '../entities/social_entity.dart';
import '../repository/user_managment_repository.dart';

class SocialRegisterUseCase implements UseCase<SocialEntity, SocialParams> {

  final UserManagementRepository _repository;

  SocialRegisterUseCase(this._repository);

  @override
  Future<Result<BaseError, SocialEntity>> call(SocialParams params){
    print('social register : ${params.data.email}');
   return _repository.socialRegister(socialRegisterRequest: params.data);
  }

}

class SocialParams extends BaseParams{
  SocialRegisterRequest data;
  CancelToken cancelToken;

  SocialParams({required this.data, required this.cancelToken}): super(cancelToken: cancelToken);
}
