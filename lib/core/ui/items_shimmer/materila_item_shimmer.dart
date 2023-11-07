import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import 'base_container_shimmer.dart';
import 'material_shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MaterialItemShimmer extends StatelessWidget {
  const MaterialItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: ColorManager.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 21.w, top: 23.h, bottom: 23.h, left: 21.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseContainerShimmer(width: 120.w, height: 15.h,),
                BaseContainerShimmer(width: 22.w, height: 22.h,),

              ],
            ),
            heightSpace(19.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /////////////FISRT COLUMN////////////////////
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseContainerShimmer(width: 120.w, height: 15.h,),
                    heightSpace(9.h),
                    BaseContainerShimmer(width: 120.w, height: 15.h,),
                  ],
                ),
                widthSpace(40.w),
                /////////////////SECOND///////////////////////
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseContainerShimmer(width: 140.w, height: 15.h,),
                    heightSpace(9.h),
                    BaseContainerShimmer(width: 120.w, height: 15.h,),
                  ],
                ),
                ///////////////THIRD COLUMN//////////////////
              ],
            )
          ],
        ),
      ),
    );
  }
}
