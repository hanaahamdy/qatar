

import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../domain/entity/settings_entity.dart';
import '../../domain/repository/account_repository.dart';
import '../../domain/usecase/about_usecase.dart';
import '../../domain/usecase/settings_usecase.dart';


abstract class SettingsState extends Equatable {}

class AboutUninitialized extends SettingsState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AboutUninitialized';
}

class SettingsLoading extends SettingsState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AboutLoading';
}

class SettingsSuccess extends SettingsState {
  final List<SettingsEntity>? data;

  SettingsSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'AboutSuccess { data: $data }';
}


class SettingsFailure extends SettingsState {
  final BaseError? error;
  final VoidCallback? callback;

  SettingsFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'AboutFailure { error: $error }';
}

class SettingsEvent extends Equatable {

  CancelToken cancelToken;
  SettingsEvent({
    required this.cancelToken
  });

  @override
  List<Object> get props => [

  ];

  @override
  String toString() => 'AboutEvent';
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(AboutUninitialized());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    yield SettingsLoading();
    final result = await SettingsUseCase(locator<AccountRepository>())(
        NoParams(cancelToken: event.cancelToken)
    );

    if (result.hasDataOnly) {
      yield SettingsSuccess(data: result.data);
    }
    if (result.hasErrorOnly) {
      yield SettingsFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}