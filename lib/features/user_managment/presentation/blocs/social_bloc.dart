import 'dart:math';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/services/firebase_sservices.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../data/api_requests/login_request.dart';
import '../../data/api_requests/social_login_request.dart';
import '../../data/api_requests/social_register_request.dart';
import '../../data/api_requests/user_request.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/social_entity.dart';
import '../../domain/repository/user_managment_repository.dart';
import '../../domain/usecase/check_user_exist.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/social_login_usecase.dart';
import '../../domain/usecase/social_register_usecase.dart';

abstract class SocilaState extends Equatable {}

class SocialUninitialized extends SocilaState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SocialUninitialized';
}

class SocilaLoading extends SocilaState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SocilaLoading';
}

class SocilaSuccess extends SocilaState {
  final SocialEntity? data;

  SocilaSuccess({this.data});

  @override
  List<Object> get props => [data!];

  @override
  String toString() => 'SocilaSuccess { data: $data }';
}

class SocialFailure extends SocilaState {
  final BaseError? error;
  final VoidCallback? callback;

  SocialFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'SocialFailure { error: $error }';
}

class SocialEvent extends Equatable {
  final String type;
  final BuildContext context;

  SocialEvent({required this.context, required this.type});

  @override
  List<Object> get props => [context, type];

  @override
  String toString() => 'LoginEvent';
}

class SocialBloc extends Bloc<SocialEvent, SocilaState> {

  //FirebaseFirestore firestore = FirebaseFirestore.instance;

  SocialBloc() : super(SocialUninitialized());

  @override
  Stream<SocilaState> mapEventToState(SocialEvent event) async* {

    yield SocilaLoading();

    User value = await locator<FirebaseServices>().signInWithApple(context: event.context,  scopes: [Scope.email, Scope.fullName]);

    final checkUserExist = await CheckUserUseCase(locator<UserManagementRepository>())(
      UserParams(
        data: UserRequest(
            profileId: value.uid.toString()),
        cancelToken: CancelToken(),
      ),
    );

    if(checkUserExist.data!.success==true){
      final result = await SocialLoginUseCase(locator<UserManagementRepository>())(
        SocialLoginParams(
          data: SocialLoginRequest(
              email: value.email ?? '${value.displayName}00@mail.com'.replaceAll(" ", "."),
              profileId: value.uid
          ),
          cancelToken: CancelToken(),
        ),
      );

      if (result.hasDataOnly) {
        locator<AppPreferences>().persistToken(result.data!.token!);
        locator<AppPreferences>().persistUserData(value.displayName ?? 'user');
        //locator<AppPreferences>().persistUserId(result.data!.id!, value.photoURL??"");
        yield SocilaSuccess(data: result.data);

      }
      if (result.hasErrorOnly) {
        yield SocialFailure(
          error: result.error!,
          callback: () {
            this.add(event);
          },
        );
      }
    } else{
      final result = await SocialRegisterUseCase(locator<UserManagementRepository>())(
        SocialParams(
          data: SocialRegisterRequest(
              name: value.displayName ?? 'user',
              email: value.email ?? '${value.displayName}00@mail.com'.replaceAll(" ", "."),
              phone: value.phoneNumber ?? "01010101010",
              profileId: value.uid ?? '1234567',
              provideName: 'apple'
          ),
          cancelToken: CancelToken(),
        ),
      );
      if (result.hasDataOnly) {
        locator<AppPreferences>().persistToken(result.data!.token!);
        locator<AppPreferences>().persistUserData(value.displayName ?? 'user');
        //locator<AppPreferences>().persistUserId(result.data!.id!, value.photoURL??"");
        yield SocilaSuccess(data: result.data);
      }
      if (result.hasErrorOnly) {
        yield SocialFailure(
          error: result.error!,
          callback: () {
            this.add(event);
          },
        );
      }
    }


  }
}
