
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:ehsan_1/features/user_managment/presentation/pages/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_apple_sign_in/apple_sign_in_button.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/ui/widgets/general_widgets/show_error_widget.dart';
import '../../../../core/ui/widgets/styled_button.dart';
import '../../../../core/ui/widgets/styled_text_field.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../../services/presentation/bloc/add_service_bloc.dart';
import '../../../services/presentation/pages/services_page.dart';
import '../../data/api_requests/social_register_request.dart';
import '../../domain/repository/user_managment_repository.dart';
import '../../domain/usecase/social_register_usecase.dart';
import '../blocs/local_auth_bloc.dart';
import '../blocs/login_bloc.dart';
import '../blocs/social_bloc.dart';
import 'forgot_password_view.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart' as stp;
import 'dart:io' show Platform;

bool click = false;
bool secure = true;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _bloc = LoginBloc();
  final SocialBloc _socialBloc = SocialBloc();

 bool _isAvailableFuture = false;

  // final FaceBloc _faceBloc = FaceBloc();
  // final LocalAuthBloc _localAuthBloc = LocalAuthBloc();

  @override
  void initState() {
    getRemember();
    super.initState();
  }

  getRemember() async {
    var value = await locator<AppPreferences>().getUser();
    bool avaiable  = await TheAppleSignIn.isAvailable();
    if (value.isNotEmpty) {
      setState(() {
        _userEmailController.text = value["phone"];
        _userPasswordController.text = value["password"];
        _isAvailableFuture = avaiable;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(16.w), child: _loginWidget()),
    )));
  }

  _loginWidget() {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (_, state) {
        if (state is LoginSuccess) {
          Get.offAll(ServicesPage());
        } else if (state is LoginLoading) {
          showMyDialog(context);
        } else if (state is LoginFailure) {
          Get.back();
          showFailureDialoge(
              context,
              state.error!.message
                  .toString()
                  .replaceAll("{", "")
                  .replaceAll("}", ""));
        }
      },
      child: Column(
        children: [
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Icon(
          //     Icons.close,
          //     size: 15.w,
          //   ),
          // ).onTap(() {
          //   Get.back();
          // }),
          heightSpace(7.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logo, height: 71.h, width: 101.w),
              heightSpace(25.h),
              font22Text('تسجيل الدخول',
                  textAlign: TextAlign.center, fontWeight: FontWeight.bold),
              font14Text('قم بتسجيل دخولك واملأ البيانات التالية',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.grey),
              heightSpace(42.h),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.mobile,
                        height: 20.h, width: 16.w, color: ColorManager.primary),
                    widthSpace(10.w),
                    font14Text('رقم الموبايل',
                        fontWeight: FontWeight.w500, color: ColorManager.grey),
                  ],
                ),
                heightSpace(14.h),
                StyledTextField(
                  controller: _userEmailController,
                  keyboardType: TextInputType.phone,
                ),
                heightSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.lock,
                        height: 20.h, width: 16.w, color: ColorManager.primary),
                    widthSpace(10.w),
                    font14Text('كلمة المرور',
                        fontWeight: FontWeight.w500, color: ColorManager.grey),
                  ],
                ),
                heightSpace(14.h),
                StyledTextField(
                  controller: _userPasswordController,
                  maxLines: 1,
                  secureText: secure,
                  suffixWidget: SvgPicture.asset(ImageAssets.eye,
                          height: 14.h, width: 24.w)
                      .onTap(() {
                    setState(() {
                      secure = !secure;
                    });
                  }),
                ),
                heightSpace(27.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    font14Text('هل نسيت كلمة المرور ؟',
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary)
                        .onTap(() {
                      Get.to(ForgetPasswordScreen());
                    }),
                    Spacer(),
                    font14Text('تذكرني', fontWeight: FontWeight.w500),
                    widthSpace(10.w),
                    Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: click
                              ? ColorManager.primary
                              : ColorManager.grey1),
                      child: Icon(Icons.done,
                          color: click
                              ? ColorManager.white
                              : ColorManager.primary),
                    ).onTap(() {
                      setState(() {
                        click = !click;
                      });
                    }),
                  ],
                ),
                heightSpace(28.h),
                StyledButton(
                    radius: true,
                    function: () async {
                      if (_formKey.currentState!.validate()) {
                        _bloc.add(LoginEvent(
                            email: _userEmailController.text,
                            password: _userPasswordController.text));

                        ///store phone and password
                        if (click == true) {
                          await locator<AppPreferences>().saveUser(
                              _userEmailController.text,
                              _userPasswordController.text);
                        } else {
                          await locator<AppPreferences>().removeUser();
                        }
                      }
                    },
                    child: font16Text('تسجيل دخول',
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold)),
                heightSpace(25.h),
                Platform.isAndroid ? Container(): _buildOrWidget(),
                heightSpace(25.h),
                Platform.isAndroid ? Container(): BlocListener<SocialBloc, SocilaState>(
                  bloc: _socialBloc,
                  listener: (_, state){
                    if(state is SocilaSuccess){
                      Get.back();
                      Get.offAll(ServicesPage());
                    }
                    else if(state is SocilaLoading){
                      showMyDialog(context);
                    }
                    else if(state is SocialFailure){
                      Get.back();
                      showFailureDialoge(context, state.error!.message!);
                    }
                  },
                  child: AppleSignInButton(
                    style: stp.ButtonStyle.black, // style as needed
                    type: ButtonType.signIn, // style as needed
                    onPressed: () async{
                      _socialBloc.add(SocialEvent(context: context, type: ""));
                    },
                  ),
                ),
                heightSpace(10.h),
                // BlocListener<LocalAuthBloc, LocalAuthState>(
                //     bloc: _localAuthBloc,
                //     listener: (_, state) {
                //       if (state is LocalAuthSuccess) {
                //         Get.back();
                //         Get.offAll(MainPage());
                //       } else if (state is LocalAuthLoading) {
                //         showMyDialog(context);
                //       } else if (state is LocalAuthFailure) {
                //         Get.back();
                //         showFailureDialoge(context, state.error!.message);
                //       }
                //     },
                //     child: Center(
                //             child: font14Text('الدخول ببصمة الوجه',
                //                 color: ColorManager.primary,
                //                 textDecoration: TextDecoration.underline,
                //                 textAlign: TextAlign.center,
                //                 fontWeight: FontWeight.bold))
                //         .onTap(() {
                //       _localAuthBloc.add(LocalAuthEvent(context: context));
                //     })),
                heightSpace(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    font14Text('حساب جديد',
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold),
                    widthSpace(3.w),
                    font14Text('ليس لديك حساب ؟',
                        color: ColorManager.grey, fontWeight: FontWeight.w700),
                  ],
                ).onTap(() {
                  Get.to(RegisterView());
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  // _buildSocialButtons() {
  //   if (mounted) {
  //     return Row(
  //       children: [
  //         Expanded(
  //           flex: 1,
  //           child: BlocListener<SocialBloc, SocilaState>(
  //               bloc: _socialBloc,
  //               listener: (_, state) {
  //                 if (state is SocilaLoading) {
  //                   showMyDialog(context);
  //                 }
  //                 if (state is SocilaSuccess) {
  //                   Get.back();
  //                   Get.offAll(const MainPage());
  //                 } else if (state is SocialFailure) {
  //                   Get.back();
  //                   showFailureDialoge(context, state.error!.message!);
  //                 }
  //               },
  //               child:
  //                   _buildBoton('google', 'عن طريق جوجل', ImageAssets.google)),
  //         ),
  //         widthSpace(10.w),
  //         Expanded(
  //           flex: 1,
  //           child: BlocListener<FaceBloc, FaceState>(
  //               bloc: _faceBloc,
  //               listener: (_, state) {
  //                 if (state is FaceSuccess) {
  //                   Get.back();
  //                   Get.offAll(const MainPage());
  //                 } else if (state is FaceLoading) {
  //                   showMyDialog(context);
  //                 } else if (state is FaceFailure) {
  //                   Get.back();
  //                   showFailureDialoge(context, state.error!.message!);
  //                 }
  //               },
  //               child: _buildBoton(
  //                   'facebook', 'عن طريق فيسبوك', ImageAssets.facebook)),
  //         ),
  //       ],
  //     );
  //   }
  // }

  // _buildBoton(type, text, image) {
  //   return StyledButton(
  //       function: () {
  //         if (type == 'google') {
  //           _socialBloc.add(SocialEvent(context: context, type: type));
  //         } else if (type == 'facebook') {
  //           _faceBloc.add(FaceEvent(context: context));
  //         }
  //       },
  //       fillColor: ColorManager.lightGrey,
  //       radius: true,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           font14Text(text, fontWeight: FontWeight.w500),
  //           widthSpace(10.w),
  //           SvgPicture.asset(image, height: 20.h, width: 16.w),
  //         ],
  //       ));
  // }

  _buildOrWidget() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              height: 1.h,
              color: ColorManager.grey,
            )),
        widthSpace(10.w),
        font12Text('سجل دخولك عن طريق',
            color: ColorManager.grey, fontWeight: FontWeight.w500),
        widthSpace(10.w),
        Expanded(
            flex: 1,
            child: Container(
              height: 1.h,
              color: ColorManager.grey,
            ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
