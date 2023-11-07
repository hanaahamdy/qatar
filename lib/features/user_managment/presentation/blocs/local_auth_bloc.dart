// import 'dart:math';
// import 'dart:ui';
//
// import 'package:client_information/client_information.dart';
// import 'package:conforum/core/services/firebase_sservices.dart';
// import 'package:conforum/features/user_managment/data/api_requests/social_register_request.dart';
// import 'package:conforum/features/user_managment/domain/entities/social_entity.dart';
// import 'package:conforum/features/user_managment/domain/usecase/social_login_usecase.dart';
// import 'package:dio/dio.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../../../core/di/di.dart';
// import '../../../../core/errors/base_error.dart';
// import '../../../../core/errors/unknown_error.dart';
// import '../../../../core/services/local_auth_api.dart';
// import '../../../../core/utils/app_prefs.dart';
// import '../../data/api_requests/login_request.dart';
// import '../../data/api_requests/social_login_request.dart';
// import '../../data/api_requests/user_request.dart';
// import '../../domain/entities/login_entity.dart';
// import '../../domain/repository/user_managment_repository.dart';
// import '../../domain/usecase/check_user_exist.dart';
// import '../../domain/usecase/login_usecase.dart';
// import '../../domain/usecase/social_register_usecase.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// abstract class LocalAuthState extends Equatable {}
//
// class LocalAuthUninitialized extends LocalAuthState {
//   @override
//   List<Object> get props => [];
//
//   @override
//   String toString() => 'LocalAuthUninitialized';
// }
//
// class LocalAuthLoading extends LocalAuthState {
//   @override
//   List<Object> get props => [];
//
//   @override
//   String toString() => 'LocalAuthLoading';
// }
//
// class LocalAuthSuccess extends LocalAuthState {
//   final SocialEntity? data;
//
//   LocalAuthSuccess({this.data});
//
//   @override
//   List<Object> get props => [data!];
//
//   @override
//   String toString() => 'LocalAuthSuccess { data: $data }';
// }
//
// class LocalAuthFailure extends LocalAuthState {
//   final BaseError? error;
//   final VoidCallback? callback;
//
//   LocalAuthFailure({
//     required this.error,
//     this.callback,
//   }) : assert(error != null);
//
//   @override
//   List<Object> get props => [error!, callback!];
//
//   @override
//   String toString() => 'LocalAuthFailure { error: $error }';
// }
//
// class LocalAuthEvent extends Equatable {
//   final BuildContext context;
//
//   LocalAuthEvent({required this.context});
//
//   @override
//   List<Object> get props => [context];
//
//   @override
//   String toString() => 'LocalAuthEvent';
// }
//
// class LocalAuthBloc extends Bloc<LocalAuthEvent, LocalAuthState> {
//
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//
//
//   LocalAuthBloc() : super(LocalAuthUninitialized());
//
//   @override
//   Stream<LocalAuthState> mapEventToState(LocalAuthEvent event) async* {
//
//     yield LocalAuthLoading();
//
//
//     var value = await locator<LocalAuthApi>().authenticate();
//
//     // Get client information
//     ClientInformation info = await ClientInformation.fetch();
//
//     //var uuid = Uuid().v1();
//     var email = 'user@mail.com';
//     var phone = "01010101010";
//     var uuid = info.deviceId;
//
//
//     final checkUserExist = await CheckUserUseCase(locator<UserManagementRepository>())(
//       UserParams(
//         data: UserRequest(
//             profileId: uuid),
//         cancelToken: CancelToken(),
//       ),
//     );
//
//
//     if(checkUserExist.data!.success==true){
//       //register---
//       final result = await SocialLoginUseCase(locator<UserManagementRepository>())(SocialLoginParams(
//         data: SocialLoginRequest(
//             email: email,
//             profileId: uuid),
//         cancelToken: CancelToken(),
//       ),
//       );
//       if (result.hasDataOnly) {
//         locator<AppPreferences>().persistToken(result.data!.token!);
//         locator<AppPreferences>().persistUserId(result.data!.id!, "");
//         yield LocalAuthSuccess(data: result.data);
//
//       }
//       if (result.hasErrorOnly) {
//         yield LocalAuthFailure(
//           error: result.error!,
//           callback: () {
//             this.add(event);
//           },
//         );
//       }
//
//     }else{
//       //register---
//       final result = await SocialRegisterUseCase(locator<UserManagementRepository>())(SocialParams(
//         data: SocialRegisterRequest(
//             name:  'user',
//             email: email,
//             phone:  phone.toString(),
//             profileId: uuid,
//             provideName: 'faceId'),
//         cancelToken: CancelToken(),
//       ),
//       );
//       if (result.hasDataOnly) {
//         locator<AppPreferences>().persistToken(result.data!.token!);
//         locator<AppPreferences>().persistUserId(result.data!.id!, "");
//         yield LocalAuthSuccess(data: result.data);
//
//       }
//       if (result.hasErrorOnly) {
//         yield LocalAuthFailure(
//           error: result.error!,
//           callback: () {
//             this.add(event);
//           },
//         );
//       }
//     }
//
//     //
//     // var accounts = await firestore.collection("accounts").doc(email).get();
//     //
//     // if(value == true){
//     //   if(!accounts.exists){
//     //     //register---
//     //     final result = await SocialRegisterUseCase(locator<UserManagementRepository>())(SocialParams(
//     //       data: SocialRegisterRequest(
//     //           name:  'user',
//     //           email: email,
//     //           phone:  phone.toString(),
//     //           profileId: uuid,
//     //           provideName: 'faceId'),
//     //       cancelToken: CancelToken(),
//     //     ),
//     //     );
//     //     if (result.hasDataOnly) {
//     //       locator<AppPreferences>().persistToken(result.data!.token!);
//     //       locator<AppPreferences>().persistUserId(result.data!.id!);
//     //       await firestore.collection("accounts").doc(email).set({
//     //         "email": email
//     //       });
//     //       yield LocalAuthSuccess(data: result.data);
//     //
//     //     }
//     //     if (result.hasErrorOnly) {
//     //       yield LocalAuthFailure(
//     //         error: result.error!,
//     //         callback: () {
//     //           this.add(event);
//     //         },
//     //       );
//     //     }
//     //   }
//     //   else if(accounts.exists){
//     //       final result1 = await SocialLoginUseCase(locator<UserManagementRepository>())(
//     //         SocialLoginParams(
//     //           data: SocialLoginRequest(
//     //             email: email,
//     //             profileId: uuid,
//     //           ),
//     //           cancelToken: CancelToken(),
//     //         ),
//     //       );
//     //       if (result1.hasDataOnly) {
//     //         locator<AppPreferences>().persistToken(result1.data!.token!);
//     //         locator<AppPreferences>().persistUserId(result1.data!.id!);
//     //         await firestore.collection("accounts").doc(email).set({
//     //           "email": email
//     //         });
//     //         yield LocalAuthSuccess(data: result1.data);
//     //
//     //       }
//     //       if (result1.hasErrorOnly) {
//     //         yield LocalAuthFailure(
//     //           error: result1.error!,
//     //           callback: () {
//     //             this.add(event);
//     //           },
//     //         );
//     //       }
//     //   }
//     // }
//     // else {
//     //   yield LocalAuthFailure(
//     //     error: UnknownError(message: "بصمة الوجه غير متوفرة في هذا الجهاز", errors: ""),
//     //     callback: () {
//     //       this.add(event);
//     //     },
//     //   );
//     // }
//
//   }
// }
