
import 'package:ehsan_1/core/resources/styles_manager.dart';
import 'package:ehsan_1/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    fontFamily: 'LamaSans',
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    // ripple effect color
    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s16),
        displaySmall: getSemiBoldStyle(color: ColorManager.white,fontSize: 14.sp),
        displayMedium: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: 16.sp),
        labelLarge: getBoldStyle(color: ColorManager.primary, fontSize: 20.sp),

        headlineLarge: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s14),
        titleLarge: getBoldStyle(color:  ColorManager.white, fontSize: FontSize.s16),
        titleMedium:
            getMediumStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
        titleSmall:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        bodySmall: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        //subtitle1: getLightStyle(color: ColorManager.grey2, fontSize: FontSize.s14),
        bodyMedium: getRegularStyle(color: ColorManager.grey2, fontSize: FontSize.s14),
        labelSmall:
            getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s12)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding:  EdgeInsets.symmetric(horizontal: AppPadding.p14, vertical: AppPadding.p14),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius:  BorderRadius.all(Radius.circular(AppSize.s16))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius:  BorderRadius.all(Radius.circular(AppSize.s16))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius:  BorderRadius.all(Radius.circular(AppSize.s16))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius:  BorderRadius.all(Radius.circular(AppSize.s16)))),
    // label style
  );
}
