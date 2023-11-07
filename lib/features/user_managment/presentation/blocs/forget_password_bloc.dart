import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../data/api_requests/forget_password_request.dart';
import '../../data/api_requests/login_request.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repository/user_managment_repository.dart';
import '../../domain/usecase/forget_password_usecase.dart';
import '../../domain/usecase/login_usecase.dart';

abstract class ForgetPasswordState extends Equatable {}

class ForgetPasswordUninitialized extends ForgetPasswordState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginUninitialized';
}

class ForgetPasswordLoading extends ForgetPasswordState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginLoading';
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordEntity? data;

  ForgetPasswordSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'LoginSuccess { data: $data }';
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final BaseError? error;
  final VoidCallback? callback;

  ForgetPasswordFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class ForgetPsswordEvent extends Equatable {
  final String? phone;


  ForgetPsswordEvent({
    required this.phone,
  })  : assert(phone != null);

  @override
  List<Object> get props => [
    phone!
  ];

  @override
  String toString() => 'LoginEvent';
}

class ForgetPasswordBloc extends Bloc<ForgetPsswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordUninitialized());

  @override
  Stream<ForgetPasswordState> mapEventToState(ForgetPsswordEvent event) async* {

    yield ForgetPasswordLoading();

    final result = await ForgetPasswordUseCase(locator<UserManagementRepository>())(
      ForgetPassParams(
        data: ForgetPasswordRequest(
            phone: event.phone),
        cancelToken: CancelToken(),
      ),
    );

    if (result.hasDataOnly) {
      yield ForgetPasswordSuccess(data: result.data);
    }

    if (result.hasErrorOnly) {
      yield ForgetPasswordFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}