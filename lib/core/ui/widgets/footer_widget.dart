import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterWidget extends StatelessWidget {
  final icon;
  final price;
  final text;
   FooterWidget({Key? key, required this.text, required this.price, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon, height: 17.h, width: 17.w),
        widthSpace(11.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            font12Text(text, fontWeight: FontWeight.bold),
            heightSpace(6.h),
            font12Text(price,
                fontWeight: FontWeight.bold, color: ColorManager.primary),
          ],
        ),

      ],
    );
  }
}
