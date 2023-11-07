import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/results/result.dart';

import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/results/result.dart';
import '../../data/request/custom_field_request.dart';
import '../../data/request/filter_request.dart';
import '../../domain/entity/add_service_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/custom_fields_usecase.dart';
import '../../domain/usecase/filter_use_case.dart';
import '../../domain/usecase/search_usecase.dart';
abstract class FilterState extends Equatable {}

class FilterUninitialized extends FilterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddServicesUninitialized';
}

class FilterLoading extends FilterState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddServicesLoading';
}

class FilterSuccess extends FilterLoading {
  final List<AddServiceEntity> data;

  FilterSuccess({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'AddServicesSuccess { data: $data }';
}


class FilterFailure extends FilterState {
  final BaseError? error;
  final VoidCallback? callback;

  FilterFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'AddServicesFailure { error: $error }';
}

class FilterEvent extends Equatable {

  final FilterRequest data;

  const FilterEvent({required this.data});


  @override
  List<Object> get props => [
    data
  ];

  @override
  String toString() => 'ServicesEvent';

}

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterUninitialized());

  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    yield FilterLoading();

 var result= await  FilterUseCase(locator<ServicesRepository>())(
        FilterParams(data: event.data,
            cancelToken: CancelToken()));

    if (result.hasDataOnly) {
      yield FilterSuccess(data: result.data!);

    }
    if (result.hasErrorOnly) {
      yield FilterFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}