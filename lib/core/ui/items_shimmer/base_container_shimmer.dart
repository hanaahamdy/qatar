import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/color_manager.dart';

class BaseContainerShimmer extends StatelessWidget {
  final double width;
  final double height;

   BaseContainerShimmer({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[100]!,
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        // child: Center(
        //   child: Container(color:ColorManager.grey2 , height: 39.h, width: 39.w),
        // ),
      ),
    );
  }
}
