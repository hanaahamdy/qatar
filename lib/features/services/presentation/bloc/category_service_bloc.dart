
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../data/request/order_request.dart';
import '../../domain/entity/categories_service_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/adds_service.dart';
import '../../domain/usecase/categories_service.dart';
import '../../domain/usecase/cities_usecase.dart';

abstract class CategoriesServiceState extends Equatable {}

class ServicesUninitialized extends CategoriesServiceState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ServicesUninitialized';
}

class CategoriesServiceLoading extends CategoriesServiceState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ServicesLoading';
}

class CategoriesServiceSuccess extends CategoriesServiceState {
  final List<CategoriesServiceEntity> data;

  CategoriesServiceSuccess({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'ServicesSuccess { data: $data }';
}


class CategoriesServiceFailure extends CategoriesServiceState {
  final BaseError? error;
  final VoidCallback? callback;

  CategoriesServiceFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'ServicesFailure { error: $error }';
}

class CategoriesServiceEvent extends Equatable {

   final int? serviceId;
  // final int? catId;
  // final String? sort;

   const CategoriesServiceEvent({required this.serviceId});


   @override
  List<Object> get props => [
    serviceId!
  ];

  @override
  String toString() => 'ServicesEvent';

}

class CategoriesServiceBloc extends Bloc<CategoriesServiceEvent, CategoriesServiceState> {
  CategoriesServiceBloc() : super(ServicesUninitialized());

  @override
  Stream<CategoriesServiceState> mapEventToState(CategoriesServiceEvent event) async* {
    yield CategoriesServiceLoading();

    final result = await   GetCategouriesServicesUseCase(locator<ServicesRepository>())(
        GetCategouriesServicesParams(serviceId: event.serviceId!, cancelToken: CancelToken())
    );

    if (result.hasDataOnly) {
      yield CategoriesServiceSuccess(data: result.data!);

    }
    if (result.hasErrorOnly) {
      yield CategoriesServiceFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}