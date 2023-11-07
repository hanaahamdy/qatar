
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/datasource/remote_data_source.dart';
import '../../../../core/errors/base_error.dart';
import '../api_requests/Register_request.dart';
import '../api_requests/forget_password_request.dart';
import '../api_requests/login_request.dart';
import '../api_requests/social_login_request.dart';
import '../api_requests/social_register_request.dart';
import '../api_requests/user_request.dart';
import '../model/forget_password_model.dart';
import '../model/login_auth_model.dart';
import '../model/register_model.dart';
import '../model/social_model.dart';
import '../model/user_existe.dart';

abstract class UserRemoteDatasource extends RemoteDataSource {

  Future<Either<BaseError, LoginAuthModel>> register({
    required RegisterRequest data,
    CancelToken cancelToken,
  });

  Future<Either<BaseError, LoginAuthModel>> login({
   required  LoginRequest data,
   required CancelToken cancelToken,
  });


  Future<Either<BaseError, SocialModel>> socialRegister({
    required  SocialRegisterRequest data,
    required CancelToken cancelToken,
  });
  Future<Either<BaseError, SocialModel>> socialLogin({
    required  SocialLoginRequest data,
    required CancelToken cancelToken,
  });
  Future<Either<BaseError, ForgetPasswordModel>> forgetPassword({
    required  ForgetPasswordRequest forgetPasswordRequest,
    required CancelToken cancelToken,
  });

  Future<Either<BaseError, LoginAuthModel>> passPhoneCode({
    required  ForgetPasswordRequest forgetPasswordRequest,
    required CancelToken cancelToken,
  });

  Future<Either<BaseError, LoginAuthModel>> resetPassword({
    required  ForgetPasswordRequest forgetPasswordRequest,
    required CancelToken cancelToken,
  });
  Future<Either<BaseError, UserExistModel>> checkUserExist({
    required  UserRequest? userRequest,
    required CancelToken cancelToken,
  });
}
