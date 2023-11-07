import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../data/api_requests/Register_request.dart';
import '../../data/model/login_auth_model.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repository/user_managment_repository.dart';
import '../../domain/usecase/register_usecase.dart';

abstract class RegisterState extends Equatable {}

class RegisterUninitialized extends RegisterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'RegisterUninitialized';
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'RegisterLoading';
}

class RegisterSuccess extends RegisterState {
  final LoginEntity data;

  RegisterSuccess({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'RegisterSuccess { data: $data }';
}

class RegisterFailure extends RegisterState {
  final BaseError? error;
  final VoidCallback? callback;

  RegisterFailure({
    this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'RegisterFailure { error: $error }';
}

class RegisterEvent extends Equatable {
  final String phone;
  final String email;
  final String password;
  final String name;
  final String confirmPass;
  final int agree;
  final CancelToken? cancelToken;

  RegisterEvent({
    required this.cancelToken,
   required this.phone,
    required this.confirmPass,
    required this.name,
    required this.email,
    required this.agree,
    required this.password,
  });

  @override
  List<Object> get props => [

      ];

  @override
  String toString() => 'RegisterEvent';
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterUninitialized());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield RegisterLoading();
    final result = await RegisterUseCase(locator<UserManagementRepository>())(
      RegisterParams(
        data: RegisterRequest(
             name: event.name,
            confirmPass: event.confirmPass,
            agree: event.agree,
            email: event.email,
            password: event.password,
          phone: event.phone
        ),
        cancelToken: event.cancelToken!,
      ),
    );
    if (result.hasDataOnly) {
      yield RegisterSuccess(data: result.data!);
    //  locator<AppPreferences>().persistUserId(result.data!.id!, "");
      locator<AppPreferences>().persistToken(result.data!.token!);
      locator<AppPreferences>().persistUserData(result.data!.name ??"user");
    }
    if (result.hasErrorOnly) {
      yield RegisterFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}
