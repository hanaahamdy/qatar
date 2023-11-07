import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../data/api_requests/forget_password_request.dart';
import '../../data/api_requests/login_request.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repository/user_managment_repository.dart';
import '../../domain/usecase/forget_password_usecase.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/reset_password_usecase.dart';

abstract class ResetPasswordState extends Equatable {}

class ResetPasswordUninitialized extends ResetPasswordState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginUninitialized';
}

class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginLoading';
}

class ResetPasswordSuccess extends ResetPasswordState {
  final LoginEntity? data;

  ResetPasswordSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'LoginSuccess { data: $data }';
}


class ResetPasswordFailure extends ResetPasswordState {
  final BaseError? error;
  final VoidCallback? callback;

  ResetPasswordFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class ResetPasswordEvent extends Equatable {
  final String? phone;
  final String? code;
  final String? newpssword;
  final String? confirmPassword;

  ResetPasswordEvent({
    required this.phone,
    required this.code,
    required this.confirmPassword,
    required this.newpssword
  });

  @override
  List<Object> get props => [
    phone!,
    code!,
    confirmPassword!,
    newpssword!
  ];

  @override
  String toString() => 'LoginEvent';
}

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordUninitialized());

  @override
  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {

    yield ResetPasswordLoading();
    final result = await ResetPasswordUsecase(locator<UserManagementRepository>())(
      ForgetPassParams(
        data: ForgetPasswordRequest(
            phone: event.phone,
            code: event.code,
            newPassword: event.newpssword,
            confirmPassword: event.confirmPassword!),
        cancelToken: CancelToken(),
      ),
    );

    if (result.hasDataOnly) {
      yield ResetPasswordSuccess(data: result.data);
      locator<AppPreferences>().persistToken(result.data!.token!);
    }

    if (result.hasErrorOnly) {
      yield ResetPasswordFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}