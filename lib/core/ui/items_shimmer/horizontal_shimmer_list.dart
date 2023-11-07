import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_container_shimmer.dart';
import 'material_shimmer_list.dart';
import 'package:flutter/material.dart';

class HorizontalShimmerList extends StatelessWidget {
  const HorizontalShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        itemBuilder: (_, index){
           return Padding(
             padding: EdgeInsets.only(left: 20.w, right: 20.w),
             child: BaseContainerShimmer(
               width: 30.w,
               height: 30.h,
             ),
           );
        },
        itemCount: 10,
      ),
    );
  }
}
