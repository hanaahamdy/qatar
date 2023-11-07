import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';

class ViewsWidget extends StatelessWidget {
  final views;
  const ViewsWidget({Key? key, required this.views}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
   color: ColorManager.primary.withOpacity(0.1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImageAssets.eye1, color: ColorManager.primary),
          widthSpace(9.w),
          font11Text(': عدد المشاهدات', fontWeight: FontWeight.w500),
          font12Text('$viewsمشاهدة', color: ColorManager.primary, fontWeight: FontWeight.w900)
        ],
      ),
    );
  }
}
