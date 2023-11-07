

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


abstract class AboutState extends Equatable {}

class AboutUninitialized extends AboutState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AboutUninitialized';
}

class AboutLoading extends AboutState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AboutLoading';
}

class AboutSuccess extends AboutState {
  final AboutEntity? data;

  AboutSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'AboutSuccess { data: $data }';
}


class AboutFailure extends AboutState {
  final BaseError? error;
  final VoidCallback? callback;

  AboutFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'AboutFailure { error: $error }';
}

class AboutEvent extends Equatable {

  CancelToken cancelToken;
  AboutEvent({
    required this.cancelToken
  });

  @override
  List<Object> get props => [

  ];

  @override
  String toString() => 'AboutEvent';
}

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutUninitialized());

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {
    yield AboutLoading();
    final result = await AboutServiceUseCase(locator<AccountRepository>())(
        NoParams(cancelToken: event.cancelToken)
    );

    if (result.hasDataOnly) {
      yield AboutSuccess(data: result.data);
    }
    if (result.hasErrorOnly) {
      yield AboutFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}