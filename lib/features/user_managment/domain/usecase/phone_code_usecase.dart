
import 'package:dio/dio.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entities/login_entity.dart';
import '../repository/user_managment_repository.dart';
import 'forget_password_usecase.dart';

class PhoneCodeUsecase implements UseCase<LoginEntity, ForgetPassParams> {

  final UserManagementRepository _repository;

  PhoneCodeUsecase(this._repository);

  @override
  Future<Result<BaseError, LoginEntity>> call(ForgetPassParams params) => _repository.passwordPhoneCode(
      forgetPasswordRequest: params.data
  );

}

