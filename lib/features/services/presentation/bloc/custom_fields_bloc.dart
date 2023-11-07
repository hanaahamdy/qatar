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
import '../../domain/entity/custom_field_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/custom_fields_usecase.dart';


abstract class CustomServicesState extends Equatable {}

class AddServicesUninitialized extends CustomServicesState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddServicesUninitialized';
}

class CustomServicesLoading extends CustomServicesState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddServicesLoading';
}

class CustomServicesSuccess extends CustomServicesLoading {
  final List<CustomFieldEntity> data;
  final Map<String, TextEditingController>  controllers;
  final Map<String, dynamic>  dates;
  CustomServicesSuccess({required this.data, required this.controllers, required this.dates});

  @override
  List<Object> get props => [data, controllers];

  @override
  String toString() => 'AddServicesSuccess { data: $data }';
}


class CustomServicesFailure extends CustomServicesState {
  final BaseError? error;
  final VoidCallback? callback;

  CustomServicesFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'AddServicesFailure { error: $error }';
}

class CustomServiceEvent extends Equatable {

  final int? id;

  const CustomServiceEvent({required this.id});


  @override
  List<Object> get props => [
    id!
  ];

  @override
  String toString() => 'ServicesEvent';

}

class CustomFieldsBloc extends Bloc<CustomServiceEvent, CustomServicesState> {
  CustomFieldsBloc() : super(AddServicesUninitialized());

  @override
  Stream<CustomServicesState> mapEventToState(CustomServiceEvent event) async* {
    yield CustomServicesLoading();

    var result = await CustomFieldsUseCase(locator<ServicesRepository>())(
        CustomFieldsParams(
            cancelToken: CancelToken(),
            data: CustomFieldsRequest(serviceId: event.id)));

    if (result.hasDataOnly) {
        Map<String, TextEditingController> controllers = {};
        Map<String, dynamic> dates = {};
       //List<String> fields = [];

        for (var element in result.data!) {
         Map<String, dynamic> field = {};

         if(element.type =='number' || element.type =='text'){
           TextEditingController _controller  =TextEditingController();
           controllers.addAll({element.name!: _controller});
         }else if(element.type =='date'){
           dates.addAll({element.name!: '22/10/1998'});
         }
      }
      yield CustomServicesSuccess(data: result.data!, controllers: controllers, dates: dates);

    }
    if (result.hasErrorOnly) {
      yield CustomServicesFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}