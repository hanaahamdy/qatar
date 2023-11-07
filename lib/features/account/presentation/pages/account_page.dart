
import 'package:avatar_view/avatar_view.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/langauge_manager.dart';
import '../../../../core/ui/widgets/bids_item_widget.dart';
import '../../../../core/ui/widgets/styled_button.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../../user_managment/presentation/pages/login_view.dart';
import '../bloc/about_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/utils/app_prefs.dart';
import '../args/contact_us_args.dart';
import '../bloc/logout_bloc.dart';
import 'about_page.dart';
import 'conditions_page.dart';
import 'contact_us_page.dart';
import 'del_account_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  LogoutBloc _logoutBloc = LogoutBloc();
  bool auth = false;
  String? loginEntity;

  @override
  void initState() {
     isAuth();
    _getUserData();
    super.initState();
  }

  isAuth() async {
    var authVal = await locator<AppPreferences>().hasToken;
    setState(() {
      auth = authVal;
    });
  }
  _getUserData()async{
    var value = await locator<AppPreferences>().getUserData();
    setState(() {
      loginEntity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: _buildBodyWidget(context, '', '')),
      ),
    );
  }

  _buildBodyWidget(BuildContext context, String? name, String? phone) {
    return Column(
      children: [
        BlocListener<LogoutBloc, LogoutState>(
          bloc: _logoutBloc,
          listener: (_, state) {
            if (state is LogoutSuccess) {
              setState(() {
                auth = false;
                loginEntity = null;
              });
              //Get.offAll(LoginScreen());
            } else if (state is LogoutLoading) {
              // auth = true;
            }
          },
          child: Container(
              color: ColorManager.white,
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 16.w, top: 16.h, bottom: 23.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.arrow_back,
                              color: ColorManager.black)
                          .onTap(() {
                        Get.back();
                      }),
                      widthSpace(20.w),
                      AvatarView(
                          radius: 35,
                          avatarType: AvatarType.CIRCLE,
                          imagePath: ImageAssets.logo1,
                          backgroundColor: ColorManager.primary),
                      widthSpace(15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          font16Text(loginEntity==null ? 'أهلا بك  ' : 'أهلا بك  ${loginEntity}', fontWeight: FontWeight.bold),
                          heightSpace(10.h),
                        ],
                      ),
                    ],
                  ))),
        ),
        heightSpace(10.h),
        auth == true ? Container() : Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: StyledButton(function: (){
              Get.offAll(LoginScreen());
            }, child: font16Text("تسجيل الدخول أو انشاء حساب جديد", color: ColorManager.white), radius: true,)),
       heightSpace(10.h),
        Container(
          color: ColorManager.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 24.h),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///////////////////////////////////////////
                  _buildRowItem('تواصل معنا', ImageAssets.call2, () {
                    Get.to(ContactUsPage(),
                        arguments:
                            ContactUsArgs(phone: phone!, fullName: name!));
                  }),
                  heightSpace(18.h),
                  Divider(
                    thickness: 1.h,
                    color: ColorManager.lightGrey,
                  ),
                  heightSpace(18.h),
                  ///////////////////////////////////////////
                  _buildRowItem('عن التطبيق', ImageAssets.info, () {
                    Get.to(AboutPage());
                  }),
                  heightSpace(18.h),
                  Divider(
                    thickness: 1.h,
                    color: ColorManager.lightGrey,
                  ),
                  heightSpace(18.h),
                  ///////////////////////////////////////////
                  _buildRowItem('الشروط والأحكام', ImageAssets.document_text,
                      () {
                    Get.to(ConditionsPage());
                  }),
                  heightSpace(18.h),
                  Divider(
                    thickness: 1.h,
                    color: ColorManager.lightGrey,
                  ),
                  heightSpace(18.h),
                  ///////////////////////////////////////////
                  auth == true ? _buildRowItem('حذف الحساب', ImageAssets.delete, () async{
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: 'DELETE ACCOUNT',
                      desc: "Are you sure delete account?",
                      btnCancelOnPress: () {
                        Get.back();
                      },
                      btnOkOnPress: () async{
                        var result = await Get.to(DeleteAccountPage());
                        if(result == "delete"){
                          setState(() {
                            auth = false;
                            loginEntity =null;
                          });
                        }
                      },
                    ).show();
                  }): Container(),
                  heightSpace(36.h),
                  auth==true ? _buildSignOutWidget(): Container(),
                  heightSpace(36.h),

                  // _buildSignOutWidget(),
                  // heightSpace(36.h),
                  ///////////////////////////////////////////
                ],
              ),
            ),
          ),
        ),
        heightSpace(20.h)
      ],
    );
  }

  _buildSignOutWidget() {
    print("auth : $auth");
    return Visibility(
        visible: true,
        child: BlocBuilder<LogoutBloc, LogoutState>(
          bloc: _logoutBloc,
          builder: (_, state) {
            /*       if (state is LogoutSuccess) {
              //auth = state.auth;
              return Container();
            } else*/
            if (state is LogoutLoading) {
              //auth = state.auth;
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              );
            }
            return _logoutButton();
          },
        ));
  }

  _logoutButton() {
    return Center(
      child: Container(
        height: 51.h,
        width: 315.w,
        decoration: BoxDecoration(
          color: ColorManager.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageAssets.logout,
              color: ColorManager.primary,
              width: 24.w,
              height: 24.h,
            ),
            widthSpace(10.w),
            font14Text('تسجيل الخروج',
                fontWeight: FontWeightManager.semiBold,
                color: ColorManager.primary),
          ],
        ),
      ).onTap(() {
        _logoutBloc.add(LogoutEvent(cancelToken: CancelToken()));
      }),
    );
  }
}

_buildRowItem(text, icon, function) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SvgPicture.asset(icon,
          width: 24.w, height: 24.h, color: ColorManager.primary),
      widthSpace(16.w),
      font14Text(text, fontWeight: FontWeight.bold),
      Spacer(),
      SvgPicture.asset(
        ImageAssets.arrow,
        color: ColorManager.grey,
        width: 6.w,
        height: 8.h,
      ),
    ],
  ).onTap(() {
    function();
  });
}
