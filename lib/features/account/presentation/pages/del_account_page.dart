
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/ui/widgets/styled_button.dart';
import '../../../../core/ui/widgets/styled_text_field.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../bloc/del_account_bloc.dart';

TextEditingController _controller = TextEditingController();

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  DelAccountBloc _bloc = DelAccountBloc();
  bool _loading= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: font14Text('DELETE ACCOUNT',
            color: ColorManager.white, fontWeight: FontWeightManager.bold),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      BlocListener<DelAccountBloc, DelAccountState>(
                        bloc: _bloc,
                        listener:(_, state){
                          if(state is DelAccountSuccess){
                            //remove all account data---
                            locator<AppPreferences>().logout();
                            setState(() {
                              _loading = false;
                            });
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Success',
                              desc: "Account Deleted successfully",
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                Get.back(result: "delete");
                              },
                            ).show();
                          }
                          else if(state is DelAccountLoading){
                            setState(() {
                              _loading = true;
                            });
                          }
                          else if(state is DelAccountFailure){
                            setState(() {
                              _loading = false;
                            });
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heightSpace(10.h),
                            font12Text(
                                "Are you sure want to delete your account , please read how account deletion will affect",
                                color: ColorManager.grey),
                            heightSpace(10.h),
                            font14Text("Account",
                                color: ColorManager.black,
                                fontWeight: FontWeightManager.bold),
                            font12Text(
                                "deleting your account removes personal information from our database",
                                color: ColorManager.grey),
                            heightSpace(10.h),
                            font14Text("Confirm Account Deletion",
                                color: ColorManager.black,
                                fontWeight: FontWeightManager.bold),
                            heightSpace(10.h),
                            font12Text("Enter ACCOUNT DELETE to confirm:",
                                color: ColorManager.grey),
                            heightSpace(10.h),
                            StyledTextField(hint: 'Confirm delete', controller: _controller, onChange: (_){
                              if(_=="ACCOUNT DELETE"){
                                setState(() {
                                  _controller.text = "ACCOUNT DELETE";
                                });
                              }
                            },),
                            heightSpace(10.h),
                            // Spacer()
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.5,
                        child:  _loading==true ? Center(
                            child: CircularProgressIndicator(color: ColorManager.primary,)) : StyledButton(
                            width: MediaQuery.of(context).size.width,
                            function: () {
                              ///////////
                              _bloc.add(DelAccountEvent(cancelToken: CancelToken()));
                            },
                            child: Center(
                              child: font14Text("DELETE",
                                  color: ColorManager.white,
                                  fontWeight: FontWeightManager.bold),
                            ),
                            fillColor: _controller.text.toString().isNotEmpty &&
                                _controller.text == "ACCOUNT DELETE"
                                ? ColorManager.primary
                                : ColorManager.grey),
                      )
                    ],
                  )),
            ),
          )),
    );
  }
}
