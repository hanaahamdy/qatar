
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/ui/widgets/styled_text_field.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../../services/presentation/pages/services_page.dart';
import '../blocs/reset_password_bloc.dart';
import '../widgets/active_bottom_sheet.dart';
import '../widgets/styled_button.dart';

ResetPasswordBloc _bloc = ResetPasswordBloc();
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();


class NewPasswordPage extends StatelessWidget {
  final String? phone;
  final String? code;
   NewPasswordPage({Key? key, this.code, this.phone}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 15.w,
                    ).onTap(() {
                      Navigator.of(context).pop();
                    }),
                  ),
                  heightSpace(70.h),
                  Image.asset(ImageAssets.logo,
                      height: 110.h, width: 110.w),
                  heightSpace(50.h),
                  font21Text('كلمة المرور الجديدة',
                      fontWeight: FontWeight.bold),
                  heightSpace(21.h),
                  font14Text('أدخل كلمة المرور الجديدة وقم بتأكيدها',
                      color: ColorManager.grey,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500),

                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heightSpace(40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SvgPicture.asset(ImageAssets.lock,
                                height: 20.h, width: 16.w),
                            widthSpace(10.w),
                            font14Text('كلمة المرور الجديدة',
                                fontWeight: FontWeight.w500, color: ColorManager.grey),

                          ],
                        ),
                        heightSpace(14.h),
                        StyledTextField(
                          controller: _password,
                          maxLines: 1,
                          secureText: true,
                          suffixWidget: SvgPicture.asset(ImageAssets.eye,
                              height: 14.h, width: 24.w).onTap((){

                          }),
                        ),
                        heightSpace(16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SvgPicture.asset(ImageAssets.lock,
                                height: 20.h, width: 16.w),
                            widthSpace(10.w),
                            font14Text('تأكيد كلمة المرور الجديدة',
                                fontWeight: FontWeight.w500, color: ColorManager.grey),

                          ],
                        ),
                        heightSpace(14.h),
                        StyledTextField(
                          controller: _confirmPassword,
                          suffixWidget: SvgPicture.asset(ImageAssets.eye,
                              height: 14.h, width: 24.w),
                        ),
                        heightSpace(40.h),
                        BlocListener<ResetPasswordBloc, ResetPasswordState>(
                          bloc: _bloc,
                          listener: (_, state){
                            if(state is ResetPasswordSuccess){
                              Get.back();
                              showModalBottomSheetWidget(context, ActiveBottomSheet());
                              Future.delayed(Duration(seconds: 3), (){
                                Get.offAll(ServicesPage());
                              });
                            }
                            else if(state is ResetPasswordLoading){

                              showMyDialog(context);
                            }
                            else if(state is ResetPasswordFailure){
                              Get.back();
                              showFailureDialoge(context, state.error!.message);
                            }
                          },
                          child: StyledButton(
                              radius: true,
                              function: () {
                                _bloc.add(ResetPasswordEvent(phone: phone, code: code, confirmPassword: _confirmPassword.text, newpssword: _password.text));
                              },
                              child: font16Text('تأكيد',
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
