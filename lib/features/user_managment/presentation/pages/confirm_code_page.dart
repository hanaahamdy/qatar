
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/ui/widgets/general_widgets/show_error_widget.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../../services/presentation/pages/services_page.dart';
import '../args/confirm_code_args.dart';
import '../blocs/forget_password_bloc.dart';
import '../blocs/phone_code_bloc.dart';
import '../widgets/styled_button.dart';
import 'newpassword_page.dart';

PhoneCodeBloc _bloc = PhoneCodeBloc();
ForgetPasswordBloc _forgetBloc = ForgetPasswordBloc();

class ConfirmCodePage extends StatefulWidget {
  final bool isRegister;
   ConfirmCodePage({Key? key, required this.isRegister}) : super(key: key);

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage> {

 // PhoneVerifyBloc _bloc = PhoneVerifyBloc();
  final _formKey = GlobalKey<FormState>();

  String code ="";

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  var arguments = Get.arguments as ConfirmCodeArgs;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: ColorManager.lightGrey,
      borderRadius: BorderRadius.circular(6.r),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16.w),
                child: _phoneVerifyWidget()
            ),
          )),
    );
  }

  _phoneVerifyWidget(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Icon(
            Icons.arrow_back_ios,
            size: 15.w,
          ).onTap(() {
            Get.back();
          }),
        ),
        heightSpace(70.h),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logo,
                  height: 110.h, width: 110.w),
              heightSpace(50.h),
              font21Text('كود استرجاع كلمة المرور',
                  fontWeight: FontWeight.bold),
              heightSpace(21.h),
              font14Text('من فضلك أدخل الكود المكون من 6 أرقام المرسل على رقم موبايلك او بريدك',
                  color: ColorManager.grey,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500),

            ],
          ),
        ),
        heightSpace(40.h),
        font14Text('الكود', fontWeight: FontWeight.w400,  textAlign: TextAlign.start, ),
        heightSpace(26.h),
        PinPut(
          fieldsCount: 6,
          onSubmit: (String pin)  {
             setState(() {
               code = pin;
             });
        },
          eachFieldWidth: 46.w,
          eachFieldHeight: 46.h,
          pinAnimationType: PinAnimationType.fade,
          //focusNode: _pinPutFocusNode,
          controller: _pinPutController,
          submittedFieldDecoration: _pinPutDecoration,
          selectedFieldDecoration: _pinPutDecoration,
          followingFieldDecoration: _pinPutDecoration,
          textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeightManager.bold, color: ColorManager.black),
        ),
        heightSpace(25.h),
        font14Text('إعادة ارسال الكود ؟', textAlign: TextAlign.start, fontWeight: FontWeight.bold, color: ColorManager.primary).onTap((){
          _forgetBloc.add(ForgetPsswordEvent(phone: arguments.phone));
        }),
        heightSpace(26.h),
        BlocListener<PhoneCodeBloc, PhoneCodeState>(
          bloc: _bloc,
          listener: (_, state){
            if(state is PhoneCodeLoading){
              showMyDialog(context);
            }
            else if(state is PhoneCodeSuccess){
              Get.back();
              if(widget.isRegister ==true){
                Get.offAll(ServicesPage());
              }else{
                Get.off(NewPasswordPage(code: _pinPutController.text, phone: arguments.phone));
              }
            }
            else if(state is PhoneCodeFailure){
              Get.back();
               showFailureDialoge(context, state.error!.message);
            }
          },
          child: StyledButton(
              radius: true,
              function: () {
                if(_formKey.currentState!.validate()){
                   _bloc.add(PhoneCodeEvent(phone: arguments.phone, code: _pinPutController.text));
                }
              },
              child: font16Text('استرجاع كلمة المرور',
                  color: ColorManager.white,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}



