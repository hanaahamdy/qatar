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
import '../../domain/entity/add_service_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/custom_fields_usecase.dart';
import '../../domain/usecase/search_usecase.dart';
abstract class SearchState extends Equatable {}

class AddServicesUninitialized extends SearchState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddServicesUninitialized';
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddServicesLoading';
}

class SearchSuccess extends SearchLoading {
  final List<AddServiceEntity> data;

  SearchSuccess({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'AddServicesSuccess { data: $data }';
}


class SearchFailure extends SearchState {
  final BaseError? error;
  final VoidCallback? callback;

  SearchFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'AddServicesFailure { error: $error }';
}

class SearchEvent extends Equatable {

  final String search;

  const SearchEvent({required this.search});


  @override
  List<Object> get props => [
    search
  ];

  @override
  String toString() => 'ServicesEvent';

}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(AddServicesUninitialized());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    yield SearchLoading();

    var result = await SearchUseCase(locator<ServicesRepository>())(
        SearchParams(
            cancelToken: CancelToken(),
            search: event.search));

    if (result.hasDataOnly) {
      yield SearchSuccess(data: result.data!);

    }
    if (result.hasErrorOnly) {
      yield SearchFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}