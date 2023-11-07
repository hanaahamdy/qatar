

import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../domain/entity/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';
import '../../domain/request/book_request.dart';
import '../../domain/usecase/booking_usecase.dart';


abstract class BookingState extends Equatable {}

class BookingUninitialized extends BookingState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AboutUninitialized';
}

class BookingLoading extends BookingState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AboutLoading';
}

class BookingSuccess extends BookingState {
  final BookingEntity? data;

  BookingSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'AboutSuccess { data: $data }';
}


class BookingFailure extends BookingState {
  final BaseError? error;
  final VoidCallback? callback;

  BookingFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'AboutFailure { error: $error }';
}

class BookingEvent extends Equatable {

  final String? comment;
  final adId;
  final String? bookingDate;
  final String? persons;
  CancelToken? cancelToken;

  BookingEvent({
     this.cancelToken,
    this.comment,
    this.adId,
    this.bookingDate,
    this.persons
  });



  @override
  List<Object> get props => [

  ];

  @override
  String toString() => 'AboutEvent';
}

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingUninitialized());

  @override
  Stream<BookingState> mapEventToState(BookingEvent event) async* {
    yield BookingLoading();
    final result = await BookingUsUseCase(locator<BookingRepository>())(
        BookingParams(cancelToken: CancelToken() , data: BookRequest(
          adId: event.adId,
          bookingDate: event.bookingDate,
          comment: event.comment,
          persons: event.persons
        ))
    );

    if (result.hasDataOnly) {
      yield BookingSuccess(data: result.data);
    }
    if (result.hasErrorOnly) {
      yield BookingFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}