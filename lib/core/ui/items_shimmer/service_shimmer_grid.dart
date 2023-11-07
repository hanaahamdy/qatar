import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';
import 'base_container_shimmer.dart';

class ServiceShimmerGrid extends StatelessWidget {
  final count;
  const ServiceShimmerGrid({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        // childAspectRatio: MediaQuery.of(context).size.width /
        //     (MediaQuery.of(context).size.height / 1.4),
      ),
      itemBuilder: (context, index){
         return BaseContainerShimmer(  height: 90.h,
           width: 103.w,);
      },
      itemCount: count,
      shrinkWrap: true,
      padding:  EdgeInsets.only(left: 8.w, right: 8.w),
      physics :NeverScrollableScrollPhysics(),
    );
  }
}


