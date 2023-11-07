import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../resources/color_manager.dart';
import '../resources/langauge_manager.dart';
import '../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAnyWidget extends StatelessWidget {
  final Widget content;
  final String title;

  const AddAnyWidget({Key? key, required this.content, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: font14Text(title),
        centerTitle: true,
        backgroundColor: ColorManager.white,
        elevation: 0.5,
        leading: Padding(
            padding: EdgeInsets.all(16.w),
            child: Get.locale ==ARABIC_LOCAL ? FaIcon(FontAwesomeIcons.chevronRight, color: ColorManager.black, size: 13.w,) :  FaIcon(FontAwesomeIcons.chevronLeft, color: ColorManager.black, size: 13.w,)

        ).onTap((){
          Get.back();
        })),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16.w),
            child: content)
      ),
    );
  }
}
