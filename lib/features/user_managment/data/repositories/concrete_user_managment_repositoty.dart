
import 'package:dio/dio.dart';

import '../../../../core/errors/base_error.dart';
import '../../../../core/results/result.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/entities/social_entity.dart';
import '../../domain/entities/user_exist_entity.dart';
import '../../domain/repository/user_managment_repository.dart';
import '../api_requests/Register_request.dart';
import '../api_requests/forget_password_request.dart';
import '../api_requests/login_request.dart';
import '../api_requests/social_login_request.dart';
import '../api_requests/social_register_request.dart';
import '../api_requests/user_request.dart';
import '../datasource/user_remote_datasource.dart';
import '../model/forget_password_model.dart';
import '../model/login_auth_model.dart';
import '../model/register_model.dart';
import '../model/social_model.dart';
import '../model/user_existe.dart';


CancelToken cancelToken = CancelToken();

class ConcreteUserManagementRepository extends UserManagementRepository{

  final UserRemoteDatasource remoteDataSource;

  ConcreteUserManagementRepository(this.remoteDataSource) : super();


  @override
  Future<Result<BaseError, LoginEntity>> login({LoginRequest? loginRequest}) async{
    final remoteResult = await remoteDataSource.login(
      data: loginRequest!,
      cancelToken: cancelToken,
    );
    return execute<LoginAuthModel, LoginEntity>(
        remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, LoginEntity>> register({RegisterRequest? registerRequest}) async{
    final remoteResult = await remoteDataSource.register(
      data: registerRequest!,
      cancelToken: cancelToken,
    );
    return execute<LoginAuthModel, LoginEntity>(
        remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, SocialEntity>> socialRegister({SocialRegisterRequest? socialRegisterRequest}) async{
    final remoteResult = await remoteDataSource.socialRegister(
      data: socialRegisterRequest!,
      cancelToken: cancelToken,
    );
    return execute<SocialModel, SocialEntity>(
        remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, SocialEntity>> socialLogin({SocialLoginRequest? socialLoginRequest}) async{
    final remoteResult = await remoteDataSource.socialLogin(
      data: socialLoginRequest!,
      cancelToken: cancelToken,
    );
    return execute<SocialModel, SocialEntity>(
        remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, ForgetPasswordEntity>> forgetPassword({required ForgetPasswordRequest forgetPasswordRequest}) async{
    final remoteResult = await remoteDataSource.forgetPassword(
      forgetPasswordRequest: forgetPasswordRequest,
      cancelToken: cancelToken,
    );
    return execute<ForgetPasswordModel, ForgetPasswordEntity>(
        remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, LoginEntity>> passwordPhoneCode({required ForgetPasswordRequest forgetPasswordRequest}) async{
    final remoteResult = await remoteDataSource.passPhoneCode(
      forgetPasswordRequest: forgetPasswordRequest,
      cancelToken: cancelToken,
    );
    return execute<LoginAuthModel, LoginEntity>(
        remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, LoginEntity>> resetPassword({required ForgetPasswordRequest forgetPasswordRequest}) async{
    final remoteResult = await remoteDataSource.resetPassword(
      forgetPasswordRequest: forgetPasswordRequest,
      cancelToken: cancelToken,
    );
    return execute<LoginAuthModel, LoginEntity>(
        remoteResult: remoteResult);
  }

  @override
  Future<Result<BaseError, UserExistEntity>> checkUserExistence({UserRequest? userRequest}) async{
    final remoteResult = await remoteDataSource.checkUserExist(
      userRequest: userRequest,
      cancelToken: cancelToken,
    );
    return execute<UserExistModel, UserExistEntity>(
        remoteResult: remoteResult);
  }

}