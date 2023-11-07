import 'package:ehsan_1/core/ui/items_shimmer/service_loading_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_container_shimmer.dart';

class ServiceDetailsShimmer extends StatelessWidget {
  const ServiceDetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BaseContainerShimmer(
              width: MediaQuery.of(context).size.width,
              height: 150.h,
            ),
            heightSpace(20.h),
            Padding(
                padding: EdgeInsets.only(right: 16.w, left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseContainerShimmer(width: 140.w, height: 20.h,),
                    heightSpace(15.h),
                    BaseContainerShimmer(width: 150.w, height: 20.h,),
                    heightSpace(20.h),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BaseContainerShimmer(width: 150.w, height: 70.h,),
                          VerticalDivider(
                            color: Colors.black12,
                            thickness: 1.w,
                          ),
                          BaseContainerShimmer(width: 150.w, height: 70.h,),
                        ],
                      ),
                    ),
                    heightSpace(20.h),
                    BaseContainerShimmer(width: 150.w, height: 20.h,),
                    // Html(
                    //     data: state.data.description
                    // ),
                    heightSpace(24.h),
                    BaseContainerShimmer(width: 150.w, height: 20.h,),
                    heightSpace(24.h),
                    BaseContainerShimmer(width: 150.w, height: 20.h,),
                    heightSpace(16.h),
                    BaseContainerShimmer(width: MediaQuery.of(context).size.width, height: 20.h,),
                    heightSpace(24.h),
                    BaseContainerShimmer(width: 150.w, height: 20.h,),
                    heightSpace(21.h),
                    BaseContainerShimmer(width: MediaQuery.of(context).size.width, height: 70.h,),
                    heightSpace(29.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseContainerShimmer(width: 150.w, height: 50.h,),
                        widthSpace(11.w),
                        BaseContainerShimmer(width: 150.w, height: 50.h,),
                      ],
                    ),
                    heightSpace(24.h),
                    BaseContainerShimmer(width: 150.w, height: 20.h,),
                    heightSpace(20.h),
                    BaseContainerShimmer(width: 150.w, height: 20.h,),
                    heightSpace(24.h),
                    ///////////////////////////////COMMENTS//////////////////////////////
                    ServiceLoadingWidget(),
                    heightSpace(24.h),
                  ],
                ))
          ],
        ));
  }
}
