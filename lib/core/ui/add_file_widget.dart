import 'dart:io';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/functions.dart';
import '../utils/texts.dart';

class AddFileWidget extends StatefulWidget {
  Function callback;
  bool? multi ;
   AddFileWidget({Key? key, required this.callback, required this.multi}) : super(key: key);

  @override
  State<AddFileWidget> createState() => _AddFileWidgetState();
}

class _AddFileWidgetState extends State<AddFileWidget> {
  //File file = File('');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          color: ColorManager.lightGrey),
      child: Padding(
        padding:
        EdgeInsets.only(left: 15.w, right: 15.w, bottom: 17.h, top: 17.h),
        child: Row(
          children: [
            font14Text('الملف', fontWeight: FontWeight.w900),
            const Spacer(),
            SvgPicture.asset(
              ImageAssets.document_upload,
              color: ColorManager.primary,
            ),
          ],
        ),
      ),
    ).onTap(() async{
      if(widget.multi == true){
       List<String> files =await pickMultiFiles();
       widget.callback(files);
      }else{
         String file = await pickFile();
         widget.callback(file);
      }
    });

  }

}

