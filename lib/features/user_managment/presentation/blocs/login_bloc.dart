import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../data/api_requests/login_request.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repository/user_managment_repository.dart';
import '../../domain/usecase/login_usecase.dart';

abstract class LoginState extends Equatable {}

class LoginUninitialized extends LoginState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginUninitialized';
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginLoading';
}

class LoginSuccess extends LoginState {
  final LoginEntity? data;

  LoginSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'LoginSuccess { data: $data }';
}

class LoginSuccessButNeedVerify extends LoginState {
  final LoginEntity data;

  LoginSuccessButNeedVerify({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'LoginSuccessButNeedVerify';
}

class LoginFailure extends LoginState {
  final BaseError? error;
  final VoidCallback? callback;

  LoginFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class LoginEvent extends Equatable {
  final String? email;
  final String? password;

  LoginEvent({
    required this.email,
    required this.password,
  })  : assert(email != null),
        assert(password != null);

  @override
  List<Object> get props => [
    email!,
    password!,
  ];

  @override
  String toString() => 'LoginEvent';
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginUninitialized());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    yield LoginLoading();
    final result = await LoginUseCase(locator<UserManagementRepository>())(
      LoginParams(
        data: LoginRequest(
            phone: event.email,
            password: event.password!),
        cancelToken: CancelToken(),
      ),
    );

    if (result.hasDataOnly) {
        yield LoginSuccess(data: result.data);
        locator<AppPreferences>().persistToken(result.data!.token!);
        locator<AppPreferences>().persistUserId(result.data!.id!, "");
      }

    if (result.hasErrorOnly) {
      yield LoginFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}