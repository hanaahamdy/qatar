import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../domain/entity/service_details_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/service_details_usecase.dart';

abstract class ServicesState extends Equatable {}

class ServicesUninitialized extends ServicesState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ServicesUninitialized';
}

class ServicesLoading extends ServicesState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ServicesLoading';
}

class ServicesSuccess extends ServicesLoading {
  final ServiceDetailsEntity data;

  ServicesSuccess({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'ServicesSuccess { data: $data }';
}


class ServicesFailure extends ServicesState {
  final BaseError? error;
  final VoidCallback? callback;

  ServicesFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'ServicesFailure { error: $error }';
}

class ServicesEvent extends Equatable {

  final int? serviceId;

  ServicesEvent({required this.serviceId});

  @override
  List<Object> get props => [

  ];

  @override
  String toString() => 'ServicesEvent';
}

class ServiceDetailsBloc extends Bloc<ServicesEvent, ServicesState> {
  ServiceDetailsBloc() : super(ServicesUninitialized());

  @override
  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    yield ServicesLoading();
    final result = await GetServiceDetailsUseCase(locator<ServicesRepository>())(
        ServiceDetailsParams(serviceId: event.serviceId!, cancelToken: CancelToken())
    );

    if (result.hasDataOnly) {
      yield ServicesSuccess(data: result.data!);

    }
    if (result.hasErrorOnly) {
      yield ServicesFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}