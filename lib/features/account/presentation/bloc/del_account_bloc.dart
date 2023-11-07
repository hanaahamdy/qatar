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
import '../../domain/usecase/del_account_usecase.dart';
import '../../domain/usecase/logout_usecase.dart';

abstract class DelAccountState extends Equatable {}

class DelAccountUninitialized extends DelAccountState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LogoutUninitialized';
}

class DelAccountLoading extends DelAccountState {
  bool auth;

  DelAccountLoading({required this.auth});
  @override
  List<Object> get props => [
    auth
  ];

  @override
  String toString() => 'LogoutLoading';
}

class DelAccountSuccess extends DelAccountState {
  bool delete;
  DelAccountSuccess({required this.delete});

  @override
  List<Object> get props => [
    delete
  ];

  @override
  String toString() => 'LogoutSuccess { data:  }';
}

class DelAccountFailure extends DelAccountState {
  final BaseError? error;
  final VoidCallback? callback;

  DelAccountFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'LogoutFailure { error: $error }';
}

class DelAccountEvent extends Equatable {
  CancelToken cancelToken;

  DelAccountEvent({required this.cancelToken});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LogoutEvent';
}

class DelAccountBloc extends Bloc<DelAccountEvent, DelAccountState> {
  DelAccountBloc() : super(DelAccountUninitialized());

  @override
  Stream<DelAccountState> mapEventToState(DelAccountEvent event) async* {

    yield DelAccountLoading(auth: false);

    final result = await DelAccountUseCase(locator<AccountRepository>())(
        NoParams(cancelToken: event.cancelToken));

    if (result.hasDataOnly) {
      locator<AppPreferences>().logout();
      yield DelAccountSuccess(delete: true);
    }
    if (result.hasErrorOnly) {
      yield DelAccountFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}
