import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../features/services/presentation/pages/search/search_page.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../utils/texts.dart';

class SearchWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String? hint;
  final Color? color;

  SearchWidget({
    this.width,
    this.height,
    this.hint,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      //height: height?? 60.h,
      decoration: BoxDecoration(
        color: color ?? ColorManager.grey3,
        borderRadius: BorderRadius.all(Radius.circular(6.w))
      ),
      child:Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            font12Text(hint ?? '', color: ColorManager.grey),
            SvgPicture.asset(ImageAssets.search,
                height: 24.h, width: 24.w),
          ],
        ),
      )
    ).onTap((){
      Get.to(SearchPage(hint: hint));
    });
  }
}
