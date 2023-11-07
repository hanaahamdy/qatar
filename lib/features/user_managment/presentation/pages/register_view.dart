import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/ui/widgets/general_widgets/progress_hud_widget.dart';
import '../../../../core/ui/widgets/general_widgets/show_error_widget.dart';
import '../../../../core/ui/widgets/styled_text_field.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../../services/presentation/pages/services_page.dart';
import '../args/confirm_code_args.dart';
import '../blocs/register_bloc.dart';
import '../widgets/styled_button.dart';
import 'confirm_code_page.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool agree= false;
  bool sec1 = true;
  bool sec2 = true;

  RegisterBloc _bloc = RegisterBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: BlocListener<RegisterBloc, RegisterState>(
              bloc: _bloc,
              listener: (_, state){
                if(state is RegisterSuccess){
                //  Get.off( ConfirmCodePage(isRegister: true), arguments: ConfirmCodeArgs(phone: _phoneController.text));
                  Get.offAll(ServicesPage());
                }
                if(state is RegisterLoading){
                  showMyDialog(context);
                }
                if(state is RegisterFailure){
                  Get.back();
                  showFailureDialoge(context, state.error!.message.toString().replaceAll("{", "").replaceAll("}", "").replaceAll(",", "").replaceAll(",", "\n"));
                }
              },
              child: _registerView(),
            )
          ),
        )));
  }

  _registerView(){
    return  Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.close,
              size: 15.w,
            ),
          ).onTap((){
            Get.back();
          }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logo,
                  height: 71.h, width: 101.w),
              heightSpace(25.h),
              font22Text('حساب جديد',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold),
              font14Text('قم بانشاء حساب جديد وتمتع بمميزات التطبيق',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.grey),
              heightSpace(42.h),
            ],
          ),
          heightSpace(20.h),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.user,
                        height: 20.h, width: 16.w, color: ColorManager.primary),
                    widthSpace(10.w),
                    font14Text('الاسم',
                        fontWeight: FontWeight.w500,
                        color: ColorManager.grey),
                  ],
                ),
                heightSpace(14.h),
                StyledTextField(controller: _nameController, validator: (text){
                  if (text == null || text.isEmpty) {
                    return 'Can\'t be empty';
                  }
                }),
                heightSpace(16.h),
                //-------------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.sms,
                        height: 20.h, width: 16.w, color: ColorManager.primary),
                    widthSpace(10.w),
                    font14Text('البريد الالكتروني',
                        fontWeight: FontWeight.w500,
                        color: ColorManager.grey),
                  ],
                ),
                heightSpace(14.h),
                StyledTextField(controller: _emailController, validator: (text){
                  if (text == null || text.isEmpty) {
                    return 'Can\'t be empty';
                  }
                }
                  ,),
                heightSpace(16.h),
                /////////////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.mobile,
                        height: 20.h, width: 16.w, color:ColorManager.primary),
                    widthSpace(10.w),
                    font14Text('رقم الموبايل',
                        fontWeight: FontWeight.w500,
                        color: ColorManager.grey),
                  ],
                ),
                heightSpace(14.h),
                StyledTextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone, validator: (text){
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                    }),
                heightSpace(16.h),
                //////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.lock,
                        height: 20.h, width: 16.w, color: ColorManager.primary),
                    widthSpace(10.w),
                    font14Text('كلمة المرور',
                        fontWeight: FontWeight.w500,
                        color: ColorManager.grey),
                  ],
                ),
                heightSpace(14.h),
                StyledTextField(
                  secureText: sec1,
                  maxLines: 1,
                  controller: _passwordController,
                  validator: (text){
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                  },
                  suffixWidget: SvgPicture.asset(ImageAssets.eye,
                      height: 14.h, width: 24.w, color: ColorManager.primary).onTap((){
                        setState(() {
                          sec1= !sec1;
                        });
                  }),
                ),
                heightSpace(16.h),
                ///////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.lock,
                        height: 20.h, width: 16.w),
                    widthSpace(10.w),
                    font14Text('تأكيد كلمة المرور',
                        fontWeight: FontWeight.w500,
                        color: ColorManager.grey),
                  ],
                ),
                heightSpace(14.h),
                StyledTextField(
                  secureText: sec2,
                  maxLines: 1,
                  validator: (text){
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                  },
                  controller: _confirmPasswordController,
                  suffixWidget: SvgPicture.asset(ImageAssets.eye,
                      height: 14.h, width: 24.w).onTap((){
                    setState(() {
                      sec2= !sec2;
                    });
                  }),
                ),
                heightSpace(16.h),
                ////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:agree ?  ColorManager.primary: ColorManager.grey1),
                      child: Icon(Icons.done, color: agree? ColorManager.white: ColorManager.primary),
                    ).onTap((){
                      setState(() {
                        agree = !agree;
                      });
                    }),
                    widthSpace(10.w),
                    font14Text('أوافق على الشروط والأحكام',
                        fontWeight: FontWeight.w500),
                  ],
                ),
                heightSpace(27.h),
                StyledButton(
                    radius: true,
                    function: () {
                      if(_formKey.currentState!.validate()){
                        _bloc.add(RegisterEvent(cancelToken: CancelToken(), phone: _phoneController.text,
                            confirmPass: _confirmPasswordController.text,
                            name: _nameController.text, email: _emailController.text,
                            agree: agree ==true ? 1:0, password: _passwordController.text));
                      }
                    },
                    child: font16Text('تسجيل دخول',
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
