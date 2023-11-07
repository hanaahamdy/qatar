import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import 'base_container_shimmer.dart';
import 'material_shimmer_list.dart';

class ProjectDetailsShimmer extends StatelessWidget {
  const ProjectDetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: BaseContainerShimmer(width: 150.w, height: 20.h),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseContainerShimmer(width: 150.w, height: 20.h),
                  heightSpace(9.h),
                  BaseContainerShimmer(width: 150.w, height: 20.h),
                ],
              ),
            ),

          ],
        ),
        heightSpace(26.h),
        Divider(thickness: 1.h, color: ColorManager.grey1,),
        heightSpace(22.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseContainerShimmer(width: 150.w, height: 20.h),
            Row(
              children: [
                BaseContainerShimmer(width: 24.w, height: 24.h),
                widthSpace(5.w),
                BaseContainerShimmer(width: 150.w, height: 20.h),

              ],
            )
          ],
        ),
        heightSpace(20.h),
        BaseContainerShimmer(width: MediaQuery.of(context).size.width, height: 50.h),
        heightSpace(24.h),
    MaterialShimmerWidget()
      ],
    );
  }
}
