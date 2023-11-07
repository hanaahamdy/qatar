
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:ehsan_1/core/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/texts.dart';
import '../../data/model/custom_filel_model.dart';

class CustomFieldsWidgets extends StatelessWidget {
  List<CustomFieldModel> customs;
  //List<String> serviceData;
   CustomFieldsWidgets({Key? key, required this.customs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: _handleTypeWidget(customs[i].type, customs[i].labelTitle, customs[i].value)
        );
      },
      itemCount: customs.length,
    );
  }

  Widget _handleTypeWidget(type, title, value){
      return Row(
        children: [
          font15Text('$title :- ', fontWeight: FontWeight.bold),
          widthSpace(20.w),
          // Html(
          //     data: state.data.description
          // ),
            Expanded(
            child: font12Text(value, fontWeight: FontWeight.w500, color: ColorManager.primary).onTap(() async{
              if(await canLaunchUrl(Uri.parse(value))){
                 launchUrl(Uri.parse(value));
              }
            }),
          ),
        ],
      );
    // }else if(type=='number'){
    //
    // }
    // else if(type =="date"){
    //
    // }
  }

}
