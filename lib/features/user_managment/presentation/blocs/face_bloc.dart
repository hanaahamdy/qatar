// import 'dart:math';
// import 'dart:ui';
//
// import 'package:dio/dio.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/di/di.dart';
// import '../../../../core/errors/base_error.dart';
// import '../../../../core/utils/app_prefs.dart';
// import '../../data/api_requests/login_request.dart';
// import '../../data/api_requests/social_login_request.dart';
// import '../../data/api_requests/social_register_request.dart';
// import '../../data/api_requests/user_request.dart';
// import '../../domain/entities/social_entity.dart';
// import '../../domain/repository/user_managment_repository.dart';
// import '../../domain/usecase/check_user_exist.dart';
// import '../../domain/usecase/login_usecase.dart';
// import '../../domain/usecase/social_login_usecase.dart';
// import '../../domain/usecase/social_register_usecase.dart';
//
// abstract class FaceState extends Equatable {}
//
// class FaceUninitialized extends FaceState {
//   @override
//   List<Object> get props => [];
//
//   @override
//   String toString() => 'FaceUninitialized';
// }
//
// class FaceLoading extends FaceState {
//   @override
//   List<Object> get props => [];
//
//   @override
//   String toString() => 'FaceLoading';
// }
//
// class FaceSuccess extends FaceState {
//   final SocialEntity? data;
//
//   FaceSuccess({this.data});
//
//   @override
//   List<Object> get props => [data!];
//
//   @override
//   String toString() => 'FaceSuccess { data: $data }';
// }
//
// class FaceFailure extends FaceState {
//   final BaseError? error;
//   final VoidCallback? callback;
//
//   FaceFailure({
//     required this.error,
//     this.callback,
//   }) : assert(error != null);
//
//   @override
//   List<Object> get props => [error!, callback!];
//
//   @override
//   String toString() => 'FaceFailure { error: $error }';
// }
//
// class FaceEvent extends Equatable {
//   final BuildContext context;
//
//   FaceEvent({required this.context});
//
//   @override
//   List<Object> get props => [context];
//
//   @override
//   String toString() => 'FaceEvent';
// }
//
// class FaceBloc extends Bloc<FaceEvent, FaceState> {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   FaceBloc() : super(FaceUninitialized());
//
//   @override
//   Stream<FaceState> mapEventToState(FaceEvent event) async* {
//     yield FaceLoading();
//
//      var facebookLogin = FacebookLogin();
//
//      await facebookLogin.isLoggedIn ? print("facebook found"): print("facebook not found");
//
//     Map<String, dynamic>? value = await locator<FirebaseServices>().loginFacebook(event.context);
//
//      print('auth success: ${value}');
//
//     final checkUserExist = await CheckUserUseCase(locator<UserManagementRepository>())(
//       UserParams(
//         data: UserRequest(
//             profileId: value!['id'].toString()),
//         cancelToken: CancelToken(),
//       ),
//     );
//
//     if(checkUserExist.data!.success==true){
//       final result = await SocialLoginUseCase(locator<UserManagementRepository>())(
//         SocialLoginParams(
//           data: SocialLoginRequest(
//               profileId: value['id'].toString(),
//               email: value["email"] ?? '',
//           ),
//           cancelToken: CancelToken(),
//         ),
//       );
//       if (result.hasDataOnly) {
//         yield FaceSuccess(data: result.data);
//         locator<AppPreferences>().persistToken(result.data!.token!);
//         locator<AppPreferences>().persistUserId(result.data!.id!, value["picture"]["data"]["url"]);
//       }
//       if (result.hasErrorOnly) {
//         yield FaceFailure(
//           error: result.error!,
//           callback: () {
//             this.add(event);
//           },
//         );
//       }
//     }else{
//       final result = await SocialRegisterUseCase(locator<UserManagementRepository>())(
//         SocialParams(
//           data: SocialRegisterRequest(
//               name: value['name'] ?? '',
//               email: value["email"] ?? '',
//               phone: "01010101010",
//               profileId: value['id'].toString().substring(0, 10) ?? '',
//               provideName: 'facebook'),
//           cancelToken: CancelToken(),
//         ),
//       );
//       if (result.hasDataOnly) {
//         yield FaceSuccess(data: result.data);
//         locator<AppPreferences>().persistToken(result.data!.token!);
//         locator<AppPreferences>().persistUserId(result.data!.id!, value["picture"]["data"]["url"]);
//       }
//       if (result.hasErrorOnly) {
//         yield FaceFailure(
//           error: result.error!,
//           callback: () {
//             this.add(event);
//           },
//         );
//       }
//     }
//
//
//   }
// }
