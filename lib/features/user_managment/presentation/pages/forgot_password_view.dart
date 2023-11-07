import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/ui/widgets/styled_text_field.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../args/confirm_code_args.dart';
import '../blocs/forget_password_bloc.dart';
import '../widgets/styled_button.dart';
import 'package:get/get.dart';

import 'confirm_code_page.dart';

TextEditingController _phoneController= TextEditingController();
ForgetPasswordBloc _bloc = ForgetPasswordBloc();


class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.logo,
                        height: 110.h, width: 110.w),
                    heightSpace(50.h),
                    font21Text('هل نسيت كلمة المرور ؟',
                        fontWeight: FontWeight.bold),
                    heightSpace(21.h),
                    font14Text('أدخل رقم الموبايل لإرسال كود لاسترجاع كلمة المرور',
                        color: ColorManager.grey,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500),
                    heightSpace(40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(ImageAssets.mobile,
                            height: 20.h, width: 16.w),
                        widthSpace(10.w),
                        font14Text('رقم الموبايل او البريد الالكتروني',
                            fontWeight: FontWeight.w500, color: ColorManager.grey)

                      ],
                    ),
                    heightSpace(14.h),
                    StyledTextField(
                      controller: _phoneController,
                    ),
                    heightSpace(40.h),
                    BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                      bloc: _bloc,
                      listener: (_, state){
                        if(state is ForgetPasswordSuccess){
                          Get.back();
                          Get.to(ConfirmCodePage(isRegister: false), arguments: ConfirmCodeArgs(phone: _phoneController.text));
                        }
                        else if(state is ForgetPasswordLoading){
                          showMyDialog(context);
                        }
                        else if(state is ForgetPasswordFailure){
                          Get.back();
                          showFailureDialoge(context, state.error!.message);
                        }
                      },
                      child: StyledButton(
                          radius: true,
                          function: () {
                            if(_formKey.currentState!.validate()){
                              _bloc.add(ForgetPsswordEvent(phone: _phoneController.text));
                            }
                          },
                          child: font16Text('ارسال',
                              color: ColorManager.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
