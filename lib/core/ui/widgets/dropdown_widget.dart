import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownWidget extends StatelessWidget {

  final text;
  const DropDownWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          color: ColorManager.lightGrey
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 17.h, top: 17.h),
        child: Row(
          children: [
            font14Text(text, fontWeight: FontWeight.w900),
            Spacer(),
            SvgPicture.asset(ImageAssets.arrow_simple_chock),


          ],
        ),
      ),
    );
  }
}
