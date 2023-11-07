
import 'package:dartz/dartz.dart';
import 'package:dio/src/cancel_token.dart';
import 'package:ehsan_1/features/user_managment/data/datasource/user_remote_datasource.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/http/http_method.dart';
import '../api_requests/Register_request.dart';
import '../api_requests/forget_password_request.dart';
import '../api_requests/login_request.dart';
import '../api_requests/phone_verify_reques.dart';
import '../api_requests/social_login_request.dart';
import '../api_requests/social_register_request.dart';
import '../api_requests/user_request.dart';
import '../model/forget_password_model.dart';
import '../model/login_auth_model.dart';
import '../model/register_model.dart';
import '../model/social_model.dart';
import '../model/user_existe.dart';


class ConcreteUserRemoteDataSource extends UserRemoteDatasource {


  @override
  Future<Either<BaseError, LoginAuthModel>> login({required LoginRequest data, required CancelToken cancelToken}) {
    return requestAuth<LoginAuthModel, LoginAuthModel>(
      responseStr: 'LoginAuthModel',
      converter: (json) => LoginAuthModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_AUTH_LOGIN,
      data: data.toJson(),
      withAuthentication: false,
      cancelToken:cancelToken ,
    );
  }

  @override
  Future<Either<BaseError, LoginAuthModel>> register({required RegisterRequest data, CancelToken? cancelToken}) {
    return requestAuth<LoginAuthModel, LoginAuthModel>(
      responseStr: 'LoginAuthModel',
      converter: (json) => LoginAuthModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_AUTH_REGISTER,
      data: data.toJson(),
      withAuthentication: false,
      cancelToken:cancelToken! ,
    );
  }

  @override
  Future<Either<BaseError, LoginAuthModel>> phoneCodeVerify({required PhoneVerifyRequest data, required CancelToken cancelToken}) {
    return requestAuth<LoginAuthModel, LoginAuthModel>(
      responseStr: 'LoginAuthModel',
      converter: (json) => LoginAuthModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_PHONE_CODEVERIFY,
      data: data.toJson(),
      withAuthentication: false,
      cancelToken:cancelToken ,
    );
  }

  @override
  Future<Either<BaseError, SocialModel>> socialRegister({required SocialRegisterRequest data, required CancelToken cancelToken}) {
    return requestAuth<SocialModel, SocialModel>(
      responseStr: 'SocialModel',
      converter: (json) => SocialModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_SOCIAL_REGISTER,
      data: data.toJson(),
      withAuthentication: false,
      cancelToken:cancelToken ,
    );
  }

  @override
  Future<Either<BaseError, SocialModel>> socialLogin({required SocialLoginRequest data, required CancelToken cancelToken}) {
    return requestAuth<SocialModel, SocialModel>(
      responseStr: 'SocialModel',
      converter: (json) => SocialModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_SOCIAL_LOGIN,
      data: data.toJson(),
      withAuthentication: false,
      cancelToken:cancelToken ,
    );
  }

  @override
  Future<Either<BaseError, ForgetPasswordModel>> forgetPassword({required ForgetPasswordRequest forgetPasswordRequest, required CancelToken cancelToken}) async{
    return requestAuth<ForgetPasswordModel, ForgetPasswordModel>(
      responseStr: 'ForgetPasswordModel',
      converter: (json) => ForgetPasswordModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_FORGET_PASSWORD,
      data: {
        "phone": forgetPasswordRequest.phone
      },
      withAuthentication: false,
      cancelToken:cancelToken ,
    );
  }

  @override
  Future<Either<BaseError, LoginAuthModel>> passPhoneCode({required ForgetPasswordRequest forgetPasswordRequest, required CancelToken cancelToken}) async{
    return requestAuth<LoginAuthModel, LoginAuthModel>(
      responseStr: 'LoginAuthModel',
      converter: (json) => LoginAuthModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_PHONE_CODE,
      data: {
        "phone": forgetPasswordRequest.phone,
        "code": forgetPasswordRequest.code
      },
      withAuthentication: false,
      cancelToken:cancelToken ,
    );
  }

  @override
  Future<Either<BaseError, LoginAuthModel>> resetPassword({required ForgetPasswordRequest forgetPasswordRequest, required CancelToken cancelToken}) async{
    return requestAuth<LoginAuthModel, LoginAuthModel>(
      responseStr: 'LoginAuthModel',
      converter: (json) => LoginAuthModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_RESET_PASSWORD,
      data: {
        "phone": forgetPasswordRequest.phone,
        "code": forgetPasswordRequest.code,
        "new_password": forgetPasswordRequest.newPassword,
        "confirm_password": forgetPasswordRequest.confirmPassword
      },
      withAuthentication: false,
      cancelToken:cancelToken ,
    );
  }

  @override
  Future<Either<BaseError, UserExistModel>> checkUserExist({required UserRequest? userRequest, required CancelToken cancelToken}) {
    return requestAuth<UserExistModel, UserExistModel>(
      responseStr: 'UserExistModel',
      converter: (json) => UserExistModel.fromJson(json),
      method: HttpMethod.POST,
      url: API_PROFILE_ID,
      data: {
        "profile_id": userRequest!.profileId
      },
      withAuthentication: false,
      cancelToken:cancelToken ,
    );
  }


}
