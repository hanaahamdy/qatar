import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../domain/repository/account_repository.dart';
import '../../domain/usecase/about_usecase.dart';
import '../../domain/usecase/logout_usecase.dart';

abstract class LogoutState extends Equatable {}

class LogoutUninitialized extends LogoutState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LogoutUninitialized';
}

class LogoutLoading extends LogoutState {
  bool auth;

  LogoutLoading({required this.auth});
  @override
  List<Object> get props => [
    auth
  ];

  @override
  String toString() => 'LogoutLoading';
}

class LogoutSuccess extends LogoutState {
  bool auth;
  LogoutSuccess({required this.auth});

  @override
  List<Object> get props => [
    auth
  ];

  @override
  String toString() => 'LogoutSuccess { data:  }';
}

class LogoutFailure extends LogoutState {
  final BaseError? error;
  final VoidCallback? callback;

  LogoutFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'LogoutFailure { error: $error }';
}

class LogoutEvent extends Equatable {
  CancelToken cancelToken;

  LogoutEvent({required this.cancelToken});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LogoutEvent';
}

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutUninitialized());

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {

    yield LogoutLoading(auth: false);

    final result = await LogoutUseCase(locator<AccountRepository>())(
        NoParams(cancelToken: event.cancelToken));

    if (result.hasDataOnly) {
      locator<AppPreferences>().logout();
      yield LogoutSuccess(auth: true);
    }
    if (result.hasErrorOnly) {
      yield LogoutFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}
