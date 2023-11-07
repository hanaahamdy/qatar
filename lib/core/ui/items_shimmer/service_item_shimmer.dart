import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/functions.dart';
import 'base_container_shimmer.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w,),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          border: Border.all(color: ColorManager.grey1, width: 1.w)),
      child: Padding(
          padding:
          EdgeInsets.only(top: 15.h, bottom: 11.h, right: 15.w, left: 20.w),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseContainerShimmer(width: 107.w, height: 98.h),
                    widthSpace(15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseContainerShimmer(width: 107.w, height: 30.h),
                        heightSpace(9.h),
                        SizedBox(
                            width: 154.w,
                            child:   BaseContainerShimmer(width: 107.w, height: 20.h),),
                        heightSpace(11.h),
                        BaseContainerShimmer(width: 107.w, height: 20.h),
                      ],
                    ),

                  ],
                ),
                heightSpace(14.h),
                Divider(
                  color: Colors.black12,
                  thickness: 1.h,
                ),
                heightSpace(10.h),
                SizedBox(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BaseContainerShimmer(width: 107.w, height: 40.h),
                        VerticalDivider(
                          color: Colors.black12,
                          thickness: 1.w,
                        ),
                        BaseContainerShimmer(width: 107.w, height: 40.h),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
