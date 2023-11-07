
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/api_requests/Register_request.dart';
import '../../data/api_requests/forget_password_request.dart';
import '../../data/api_requests/login_request.dart';
import '../../data/api_requests/phone_verify_reques.dart';
import '../../data/api_requests/social_login_request.dart';
import '../../data/api_requests/social_register_request.dart';
import '../../data/api_requests/user_request.dart';
import '../entities/forget_password_entity.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../entities/social_entity.dart';
import '../entities/user_exist_entity.dart';

abstract class UserManagementRepository extends Repository {

  Future<Result<BaseError, LoginEntity>> login({LoginRequest loginRequest});

  Future<Result<BaseError, LoginEntity>> register({RegisterRequest registerRequest});


  Future<Result<BaseError, SocialEntity>> socialRegister({SocialRegisterRequest socialRegisterRequest});

  Future<Result<BaseError, UserExistEntity>> checkUserExistence({UserRequest userRequest});


  Future<Result<BaseError, SocialEntity>> socialLogin({SocialLoginRequest socialLoginRequest});

  Future<Result<BaseError, ForgetPasswordEntity>> forgetPassword({required ForgetPasswordRequest forgetPasswordRequest});

  Future<Result<BaseError, LoginEntity>> passwordPhoneCode({required ForgetPasswordRequest forgetPasswordRequest});

  Future<Result<BaseError, LoginEntity>> resetPassword({required ForgetPasswordRequest forgetPasswordRequest});
}













