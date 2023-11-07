
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';

class ActiveBottomSheet extends StatelessWidget {
  const ActiveBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 223.h,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          heightSpace(50.h),
          SvgPicture.asset(ImageAssets.checked,
              height: 58.h, width: 58.w),
          heightSpace(19.h),
          font16Text('تم التفعيل', fontWeight: FontWeight.w900, textAlign: TextAlign.center),
          heightSpace(12.h),
          font14Text('لقد تم تفعيل الحساب الخاص بك بنجاح', color: ColorManager.grey, fontWeight: FontWeight.w500)

        ],
      ),
    );
  }
}
