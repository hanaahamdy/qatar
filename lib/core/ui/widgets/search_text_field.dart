
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../features/services/domain/repository/services_repository.dart';
import '../../../features/services/presentation/args/search_args.dart';
import '../../../features/services/presentation/bloc/search_bloc.dart';
import '../../../features/services/presentation/pages/search/search_page.dart';
import '../../di/di.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

class SearchTextField extends StatelessWidget {
  final SearchBloc? bloc;
  final keyboardType;
  final isPassword;
  final hint;
  final controller;
  final validator;
  final textAlign;
  final Color? fillColor;
  final int? serviceId;
  final int? catId;

  // final double? borderRadius;
  final double? borderPadding;
  final Widget? suffixWidget;
  final Function? onIconPressed;
  final Function? onChange;
  final hintStyle;
  final int? maxLines;
  final bool? editable;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Function? callback;

  SearchTextField({
    this.bloc,
    this.serviceId,
    this.catId,
    this.width,
    this.height,
    this.hintStyle,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.hint,
    this.validator,
    this.onChange,
    this.borderPadding,
    this.textAlign = TextAlign.start,
    this.fillColor,
    this.borderRadius,
    this.suffixWidget,
    this.onIconPressed,
    this.maxLines,
    this.editable = true,
    this.callback
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height?? 45.h,
      child: TextFormField(
        textAlign: textAlign,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: (value) {
          if(value.length == 4 && bloc !=null){
            bloc?.add(SearchEvent(search: value));
          }
          },
        maxLines: maxLines,
        decoration: InputDecoration(
          //helperText: ' ',
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              horizontal: borderPadding ?? 10.w, vertical: 10.h),
          hintText: hint,
          hintStyle: hintStyle ?? TextStyle(color: ColorManager.grey2, fontWeight: FontWeightManager.medium, fontSize: 12.sp),
          enabled: editable!,
          filled: true,
          fillColor: ColorManager.lightGrey,
          errorStyle: TextStyle(color: ColorManager.error, fontSize: 16.sp),
          border: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(6.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(6.r),
            borderSide:  BorderSide(
              color: ColorManager.primary,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide:  BorderSide(
              color: ColorManager.error,
              style: BorderStyle.solid,
            ),
          ),
          suffixIcon: Container(
            padding: EdgeInsets.only(top: 13.h, bottom: 13.h, left: 13.w,),
            child: suffixWidget ?? Text(''),
          ),
        ),
        validator: validator,
      ),
    ).onTap((){
      Get.to(SearchPage(hint: hint), arguments: SearchArgs(serviceId, catId));}
      );
  }
}
