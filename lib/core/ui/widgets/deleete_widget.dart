import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../features/user_managment/presentation/widgets/styled_button.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';

class DeleteWidget extends StatefulWidget {
  final String? title;
  final function;

   DeleteWidget({Key? key , required this.title, required this.function}) : super(key: key);

  @override
  State<DeleteWidget> createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            heightSpace(15.h),
            Center(
              child: Container(
                width: 39.w,
                height: 5.h,
                decoration: BoxDecoration(color: ColorManager.lightGrey,
                    borderRadius: BorderRadius.all(Radius.circular(158.r))
                ),
              ),
            ),
            heightSpace(20.h),
            SvgPicture.asset(ImageAssets.delete_project),
            heightSpace(25.h),
            font16Text(widget.title!),
            heightSpace(30.h),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Row(children: [
                Expanded(
                    flex:1,
                    child: StyledButton(function: (){
                          widget.function();
                    }, child: font12Text('موافق', fontWeight: FontWeight.bold, color: ColorManager.white,), fillColor: ColorManager.primary, radius: true,)),
                widthSpace(15.w),
                Expanded(
                    flex: 1,
                    child: StyledButton(function: (){
                      Get.back();
                    }, child: font12Text('الغاء', fontWeight: FontWeight.bold, color: ColorManager.primary,), fillColor: ColorManager.lightGrey, radius: true,)),

              ],),
            ),
            heightSpace(30.h)
          ],
        )
    );
  }
}

