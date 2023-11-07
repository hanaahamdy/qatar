
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';

class StyledTextField extends StatelessWidget {
  final keyboardType;
  final isPassword;
  final hint;
  final controller;
  final validator;
  final textAlign;
  final Color? fillColor;

  // final double? borderRadius;
  final double? borderPadding;
  final Widget? suffixWidget;
  final Function? onIconPressed;
  final dynamic onChange;
  final hintStyle;
  final int? maxLines;
  final bool? editable;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final bool? secureText;

  StyledTextField({
    this.secureText,
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
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      //  height: height??  50.h,
      child: TextFormField(
        textAlign: textAlign,
        //autofocus: false,
        //focusNode: FocusNode(),
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChange ?? (_){},
        maxLines: maxLines ?? 1,
        obscureText: secureText ?? false,
        decoration: InputDecoration(
         // helperText: ' ',
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              horizontal: borderPadding ?? 10.w, vertical: 10.h),
          hintText: hint,
          hintStyle: hintStyle ?? TextStyle(color: ColorManager.grey2, fontWeight: FontWeightManager.medium, fontSize: 12.sp),
          enabled: editable!,
          filled: true,
          fillColor: ColorManager.lightGrey,
          //errorStyle: TextStyle(color: ColorManager.error, fontSize: 16.sp),
          // border: OutlineInputBorder(
          //   borderRadius:  BorderRadius.circular(6.r),
          //   borderSide: BorderSide.none,
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius:  BorderRadius.circular(6.r),
          //   borderSide:  BorderSide(
          //     color: ColorManager.primary,
          //     style: BorderStyle.solid,
          //   ),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(6.r),
          //   borderSide:  BorderSide(
          //     color: ColorManager.error,
          //     style: BorderStyle.solid,
          //   ),
          // ),
          suffixIcon: Container(
            padding: EdgeInsets.only(top: 13.h, bottom: 13.h, left: 13.w,),
            child: suffixWidget ?? Text(''),
          ),
        ),
        validator: (text){
          if (text == null || text.isEmpty) {
            return 'Can\'t be empty';
          }
        },
      ),
    );
  }
}
