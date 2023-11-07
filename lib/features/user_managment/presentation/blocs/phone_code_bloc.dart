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
import '../../domain/usecase/phone_code_usecase.dart';

abstract class PhoneCodeState extends Equatable {}

class PhoneCodeUninitialized extends PhoneCodeState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginUninitialized';
}

class PhoneCodeLoading extends PhoneCodeState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginLoading';
}

class PhoneCodeSuccess extends PhoneCodeState {
  final LoginEntity? data;

  PhoneCodeSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'LoginSuccess { data: $data }';
}


class PhoneCodeFailure extends PhoneCodeState {
  final BaseError? error;
  final VoidCallback? callback;

  PhoneCodeFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class PhoneCodeEvent extends Equatable {
  final String? phone;
  final String? code;

  PhoneCodeEvent({
    required this.phone,
    required this.code,
  });

  @override
  List<Object> get props => [
    phone!,
    code!,
  ];

  @override
  String toString() => 'LoginEvent';
}

class PhoneCodeBloc extends Bloc<PhoneCodeEvent, PhoneCodeState> {
  PhoneCodeBloc() : super(PhoneCodeUninitialized());

  @override
  Stream<PhoneCodeState> mapEventToState(PhoneCodeEvent event) async* {

    yield PhoneCodeLoading();
    final result = await PhoneCodeUsecase(locator<UserManagementRepository>())(
      ForgetPassParams(
        data: ForgetPasswordRequest(
            phone: event.phone,
            code: event.code),
        cancelToken: CancelToken(),
      ),
    );

    if (result.hasDataOnly) {
      yield PhoneCodeSuccess(data: result.data);
      locator<AppPreferences>().persistToken(result.data!.token!);
    }

    if (result.hasErrorOnly) {
      yield PhoneCodeFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}