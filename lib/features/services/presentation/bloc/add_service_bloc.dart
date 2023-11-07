import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/results/result.dart';


abstract class AddServiceState extends Equatable {}

class AddServicesUninitialized extends AddServiceState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddServicesUninitialized';
}

class AddServicesLoading extends AddServiceState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddServicesLoading';
}

class AddServicesSuccess extends AddServicesLoading {
  final dynamic data;

  AddServicesSuccess({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'AddServicesSuccess { data: $data }';
}


class AddServicesFailure extends AddServiceState {
  final BaseError? error;
  final VoidCallback? callback;

  AddServicesFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'AddServicesFailure { error: $error }';
}

class AddServiceEvent extends Equatable {

  final dynamic function;

  const AddServiceEvent({required this.function});


  @override
  List<Object> get props => [
    function
  ];

  @override
  String toString() => 'ServicesEvent';

}

class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  AddServiceBloc() : super(AddServicesUninitialized());

  @override
  Stream<AddServiceState> mapEventToState(AddServiceEvent event) async* {
    yield AddServicesLoading();

    Result<BaseError, dynamic> result =await  event.function;

    if (result.hasDataOnly) {
      yield AddServicesSuccess(data: result.data!);

    }
    if (result.hasErrorOnly) {
      yield AddServicesFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}