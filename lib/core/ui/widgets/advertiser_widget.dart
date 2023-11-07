import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';
import 'image/circle_image.dart';

class AdvirtiserWidget extends StatelessWidget {
  final user;
  const AdvirtiserWidget({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6.w)),
        border: Border.all(color: ColorManager.grey1, width: 1.w)
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            CircleImage(url: 'https://www.freepik.com/free-photo/red-black-brush-stroke-banner-background-perfect-canva_19564593.htm#&position=3&from_view=popular', radius: 25.r),
            widthSpace(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                font14Text(user.name, fontWeight: FontWeight.bold),
                heightSpace(12.h),
                font14Text(user.phone, color: ColorManager.grey2)
              ],
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.lightGrey,
                borderRadius: BorderRadius.all(Radius.circular(6.w)),
                shape: BoxShape.rectangle
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: SvgPicture.asset(ImageAssets.call1),
              )
            ).onTap((){
              makePhoneCall(user.phone);
            })
          ],
        ),
      ),
    );
  }
}
