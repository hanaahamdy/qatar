import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/results/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../data/request/add_request.dart';
import '../../data/request/order_request.dart';
import '../../domain/entity/add_service_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/adds_service.dart';
import '../../domain/usecase/all_add_service_usecase.dart';
import '../../domain/usecase/order_usecase.dart';

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
  final List<AddServiceEntity>? data;

  ServicesSuccess({required this.data});

  @override
  List<Object> get props => [data!];

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
  final int? catId;
  final String? sort;
  final bool? all;

  ServicesEvent({required this.serviceId, required this.catId,  this.sort,required this.all});

  @override
  List<Object> get props => [
    serviceId!,
    catId!,
    sort!,
    all!
  ];

  @override
  String toString() => 'ServicesEvent';
}

class AddsServiceBloc extends Bloc<ServicesEvent, ServicesState> {
  AddsServiceBloc() : super(ServicesUninitialized());

  @override
  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    yield ServicesLoading();

    Result<BaseError, List<AddServiceEntity>>?  result;
    switch(event.all){
      case true:
         result = await GetAllAddsServiceUseCase(locator<ServicesRepository>())(
             GetAllAddsServiceParams(
                cancelToken: CancelToken(),
                data: AddRequest(
                    categoryId: event.catId,
                    serviceId: event.serviceId!
                )));
         break;

      case false:
         result = await OrderUseCase(locator<ServicesRepository>())(
            OrderParams(
                cancelToken: CancelToken(),
                data: OrderRequest(
                    id: event.catId,
                    order: event.sort,
                    serviceId: event.serviceId
                )));
       break;
    }

    if (result!.hasDataOnly) {
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