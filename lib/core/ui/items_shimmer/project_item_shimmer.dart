import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import 'base_container_shimmer.dart';

class ProjectItemShimmer extends StatelessWidget {
  const ProjectItemShimmer({Key? key}) : super(key: key);

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
                BaseContainerShimmer(width: 150.w, height: 20.h,),
                BaseContainerShimmer(width: 20.w, height: 40.h,),

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
                    BaseContainerShimmer(width: 100.w, height: 20.h,),
                    heightSpace(9.h),
                    BaseContainerShimmer(width: 100.w, height: 30.h,),
                  ],
                ),
                widthSpace(60.w),
                ///////////////SECOND COLUMN//////////////////
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     BaseContainerShimmer(width: 100.w, height: 20.h,),
                    heightSpace(9.h),
                    BaseContainerShimmer(width: 100.w, height: 25.h,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
