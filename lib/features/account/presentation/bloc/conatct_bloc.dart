import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../data/requests/contact_request.dart';
import '../../domain/repository/account_repository.dart';
import '../../domain/usecase/about_usecase.dart';
import '../../domain/usecase/contact_us_usecase.dart';

abstract class ContactState extends Equatable {}

class ContactUninitialized extends ContactState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LogoutUninitialized';
}

class ContactLoading extends ContactState {
  bool auth;

  ContactLoading({required this.auth});
  @override
  List<Object> get props => [
    auth
  ];

  @override
  String toString() => 'LogoutLoading';
}

class ContactSuccess extends ContactState {
  ContactSuccess();

  @override
  List<Object> get props => [

  ];

  @override
  String toString() => 'LogoutSuccess { data:  }';
}

class ContactFailure extends ContactState {
  final BaseError? error;
  final VoidCallback? callback;

  ContactFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'LogoutFailure { error: $error }';
}

class ContactEvent extends Equatable {
  final dynamic phone;
  final dynamic name;
  final dynamic email;
  final dynamic message;
  final dynamic subject;

  CancelToken cancelToken;

  ContactEvent({required this.cancelToken,
    required this.name, required this.email, required this.phone, required this.message, required this.subject});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LogoutEvent';
}

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactUninitialized());

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {

    yield ContactLoading(auth: false);

    final result = await  ContactUsUseCase(locator<AccountRepository>())(ContactUsParams(cancelToken: CancelToken(), data: ContactRequest(
        fullName: event.name,
        phone: event.phone,
        subject: event.subject,
        message: event.message,
        email: event.email
    )));

    if (result.hasDataOnly) {
      yield ContactSuccess();
    }
    if (result.hasErrorOnly) {
      yield ContactFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}
