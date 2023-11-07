

import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../domain/entity/about_entity.dart';
import '../../domain/repository/account_repository.dart';
import '../../domain/usecase/about_usecase.dart';
import '../../domain/usecase/conditions_usecase.dart';


abstract class ConditionsState extends Equatable {}

class ConditionsUninitialized extends ConditionsState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ConditionsUninitialized';
}

class ConditionsLoading extends ConditionsState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ConditionsLoading';
}

class ConditionsSuccess extends ConditionsState {
  final AboutEntity? data;

  ConditionsSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'ConditionsSuccess { data: $data }';
}


class ConditionsFailure extends ConditionsState {
  final BaseError? error;
  final VoidCallback? callback;

  ConditionsFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'ConditionsFailure { error: $error }';
}

class ConditionsEvent extends Equatable {

  CancelToken cancelToken;
  ConditionsEvent({
    required this.cancelToken
  });

  @override
  List<Object> get props => [

  ];

  @override
  String toString() => 'ConditionsEvent';
}

class ConditionsBloc extends Bloc<ConditionsEvent, ConditionsState> {
  ConditionsBloc() : super(ConditionsUninitialized());

  @override
  Stream<ConditionsState> mapEventToState(ConditionsEvent event) async* {
    yield ConditionsLoading();
    final result = await ConditionsServiceUseCase(locator<AccountRepository>())(
        NoParams(cancelToken: event.cancelToken)
    );

    if (result.hasDataOnly) {
      yield ConditionsSuccess(data: result.data);
    }
    if (result.hasErrorOnly) {
      yield ConditionsFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}