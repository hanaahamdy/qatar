import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/utils/texts.dart';
class CategoryShowWidget extends StatelessWidget {
  final text;
   CategoryShowWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.all(Radius.circular(154.r)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 14.w, right: 14.w),
        child: font12Text(text, color: ColorManager.white, fontWeight: FontWeightManager.semiBold),
      ),
    );
  }
}
