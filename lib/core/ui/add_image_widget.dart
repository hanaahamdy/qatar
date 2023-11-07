import 'dart:io';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../utils/functions.dart';
import '../utils/texts.dart';
class AddImageWidget extends StatefulWidget {
  Function callback;
  final text;
  final color;
  final textcolor;
  final bool? mult;
   AddImageWidget({Key? key, required this.callback, required this.text
   , required this.color , required this.textcolor,required this.mult}) : super(key: key);

  @override
  State<AddImageWidget> createState() => _AddImageWidgetState();
}

class _AddImageWidgetState extends State<AddImageWidget> {
  File file = File('');
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 164.w,
          height: 106.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.w)),
            color: widget.color),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImageAssets.gallery_add,
                color: widget.textcolor,
              ),
              heightSpace(12.h),
              font12Text(widget.text,
                  color: widget.textcolor,
                  fontWeight: FontWeightManager.bold)
            ],
          )
      ).onTap(() async {
        if(widget.mult == true){
          List<String> filesPath = await pickMultiFiles();
          widget.callback(filesPath);
         }else if(widget.mult == false){
           String filePath = await pickFile();
           widget.callback(filePath);
        }}),
    );


  }
}

